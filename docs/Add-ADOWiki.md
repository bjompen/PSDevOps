
Add-ADOWiki
-----------
### Synopsis
Creates Azure DevOps Wikis

---
### Description

Creates Wikis in Azure DevOps.

---
### Related Links
* [Get-ADOWiki](Get-ADOWiki.md)
* [https://docs.microsoft.com/en-us/rest/api/azure/devops/wiki/wikis/create](https://docs.microsoft.com/en-us/rest/api/azure/devops/wiki/wikis/create)
---
### Examples
#### EXAMPLE 1
```PowerShell
Add-ADOWiki -Organization MyOrg -Project MyProject -Name MyWiki
```

#### EXAMPLE 2
```PowerShell
Get-ADORepository -Organization MyOrg -Project MyProject |
    Add-ADOWiki -Name BuildHistory
```

---
### Parameters
#### **Organization**

The Organization.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |1      |true (ByPropertyName)|
---
#### **Project**

The Project.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |2      |true (ByPropertyName)|
---
#### **Name**

The name of the wiki.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |3      |true (ByPropertyName)|
---
#### **RepositoryID**

The ID of the repository used for the wiki.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |4      |true (ByPropertyName)|
---
#### **WikiType**

The type of the wiki.  This can be either 'ProjectWiki' or 'CodeWiki'.
If a -RepositoryID is provided, this will be ignored as it must be a CodeWiki.



Valid Values:

* ProjectWiki
* CodeWiki
|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |5      |true (ByPropertyName)|
---
#### **RootPath**

The root path of the wiki within the repository.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |6      |true (ByPropertyName)|
---
#### **Server**

The server.  By default https://dev.azure.com/.
To use against TFS, provide the tfs server URL (e.g. http://tfsserver:8080/tfs).



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|false   |7      |true (ByPropertyName)|
---
#### **ApiVersion**

The api version.  By default, 5.1-preview.
If targeting TFS, this will need to change to match your server version.
See: https://docs.microsoft.com/en-us/azure/devops/integrate/concepts/rest-api-versioning?view=azure-devops



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |8      |false        |
---
#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.
    
If you pass ```-Confirm:$false``` you will not be prompted.
    
    
If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---
### Outputs
PSDevOps.Wiki


---
### Syntax
```PowerShell
Add-ADOWiki [-Organization] <String> [-Project] <String> [-Name] <String> [[-RepositoryID] <String>] [[-WikiType] <String>] [[-RootPath] <String>] [[-Server] <Uri>] [[-ApiVersion] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
---


