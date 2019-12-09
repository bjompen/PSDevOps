﻿# First, import all *-*.ps1 files from the module's root directory.
foreach ($file in Get-ChildItem -Path $psScriptRoot -Filter *-*.ps1) {
    . $file.FullName
}

# When the module loads we want to cache all possible names and metadata about the pipeline parts that exist.
# We do this with two structures:
$Script:ThingNames = #*A map of thing names to item names
[Collections.Generic.Dictionary[
string,
Collections.Generic.List[string]
]]::new([StringComparer]::OrdinalIgnoreCase)

$Script:ThingData = #* A map of thing type + thing name to thing metadata
[Collections.Generic.Dictionary[string, PSObject]]::new([StringComparer]::OrdinalIgnoreCase)

$script:GitHubActionPartNames = [Collections.Generic.Dictionary[
string,
Collections.Generic.List[string]
]]::new([StringComparer]::OrdinalIgnoreCase)

$script:GitHubPartData = [Collections.Generic.Dictionary[string, PSObject]]::new([StringComparer]::OrdinalIgnoreCase)


$myRoot = ([IO.FileInfo]$MyInvocation.MyCommand.ScriptBlock.File).Directory
$myModuleName = $MyInvocation.MyCommand.ScriptBlock.Module.Name
$myAdoDir = Get-ChildItem -Path $myRoot -Filter ado -Directory
$adoDirList = [Collections.Generic.List[IO.DirectoryInfo]]::new()
$adoDirList.Add($myAdoDir)
$gitHubActionsDirList = [Collections.Generic.List[IO.DirectoryInfo]]::new()
$myGitHubActionDir = Get-ChildItem -Path $myRoot -Filter GitHubActions -Directory
$gitHubActionsDirList.Add($myGitHubActionDir)

$loadedModules = Get-Module

:nextModule foreach ($m in $loadedModules) {
    $requiredModuleNames = @(foreach ($_ in $m.RequiredModules) {
            $_.Name
        })

    if ($requiredModuleNames -notcontains $myModuleName -and
        $m.PrivateData.PSData.Tags -notcontains $myModuleName) { continue }

    $d = [IO.DirectoryInfo][IO.Path]::GetDirectoryName($m.Path)
    foreach ($id in $d.GetDirectories()) {
        if ($id.Name -ine 'ado' -or $id.Name -ine 'GitHubActions') { continue }
        if ($id.Name -eq 'ado') {
            if ($adoDirList.Contains($id)) { continue }
            $adoDirList.Add($id)
        }

        if ($id.Name -eq 'GitHubActions') {
            $gitHubActionsDirList.Add($id)
        }
    }
}

foreach ($rootDir in $adoDirList) {
    $fileList = Get-ChildItem -Filter * -Recurse -Path $rootDir.FullName
    foreach ($f in $fileList) {
        if ($f.Directory -eq $rootDir) { continue }
        if ($f -is [IO.DirectoryInfo]) { continue }
        $n = $f.Name.Substring(0, $f.Name.Length - $f.Extension.Length)
        $t = $f.Directory.Name.TrimEnd('s')
        if (-not $ThingNames.ContainsKey($t)) {
            $ThingNames[$t] = [Collections.Generic.List[string]]::new()
        }
        if (-not $ThingNames[$t].Contains($n)) {
            $ThingNames[$t].Add($n)
        }

        $ThingData["$($t).$($n)"] = [PSCustomObject][Ordered]@{
            Name      = $n
            Type      = $t
            Extension = $f.Extension
            Path      = $f.FullName
        }
    }
}

foreach ($rootDir in $gitHubActionsDirList) {
    $fileList = Get-ChildItem -Filter * -Recurse -Path $rootDir.FullName

    foreach ($f in $fileList) {
        if ($f.Directory -eq $rootDir) { continue }
        if ($f -is [IO.DirectoryInfo]) { continue }
        $n = $f.Name.Substring(0, $f.Name.Length - $f.Extension.Length)
        $t = $f.Directory.Name.TrimEnd('s')
        if (-not $GitHubActionPartNames.ContainsKey($t)) {
            $GitHubActionPartNames[$t] = [Collections.Generic.List[string]]::new()
        }

        if (-not $GitHubActionPartNames[$t].Contains($n)) {
            $GitHubActionPartNames[$t].Add($n)
        }

        $GitHubPartData["$($t).$($n)"] = [PSCustomObject][Ordered]@{
            Name      = $n
            Type      = $t
            Extension = $f.Extension
            Path      = $f.FullName
        }
    }
}