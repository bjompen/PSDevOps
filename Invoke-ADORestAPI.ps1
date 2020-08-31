﻿function Invoke-ADORestAPI
{
    <#
    .Synopsis
        Invokes the ADO Rest API
    .Description
        Invokes the Azure DevOps REST API
    .Example
        # Uses the Azure DevOps REST api to get builds from a project
        $org = 'StartAutomating'
        $project = 'PSDevOps'
        Invoke-ADORestAPI "https://dev.azure.com/$org/$project/_apis/build/builds/?api-version=5.1"
    .Link
        Invoke-RestMethod
    #>
    [OutputType([PSObject])]
    param(
    # The REST API Url
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Url')]
    [uri]
    $Uri,

    # A Personal Access Token
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('PAT')]
    [string]
    $PersonalAccessToken,

    <#
Specifies the method used for the web request. The acceptable values for this parameter are:
 - Default
 - Delete
 - Get
 - Head
 - Merge
 - Options
 - Patch
 - Post
 - Put
 - Trace
    #>
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateSet('GET','DELETE','HEAD','MERGE','OPTIONS','PATCH','POST', 'PUT', 'TRACE')]
    [string]
    $Method = 'GET',

    # Specifies the body of the request.
    # If this value is a string, it will be passed as-is
    # Otherwise, this value will be converted into JSON.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Object]
    $Body,

    # Specifies the content type of the web request.
    # If this parameter is omitted and the request method is POST, Invoke-RestMethod sets the content type to application/x-www-form-urlencoded. Otherwise, the content type is not specified in the call.
    [string]
    $ContentType = 'application/json',

    # Specifies the headers of the web request. Enter a hash table or dictionary.
    [System.Collections.IDictionary]
    [Alias('Header')]
    $Headers,

    # A continuation token.  This is appended as a query parameter, and can be used to continue a request.
    # Invoke-ADORestAPI will call recursively invoke itself until a response does not have a ContinuationToken
    [string]
    $ContinuationToken,

    # Specifies a user account that has permission to send the request. The default is the current user.
    # Type a user name, such as User01 or Domain01\User01, or enter a PSCredential object, such as one generated by the Get-Credential cmdlet.
    [pscredential]
    [Management.Automation.CredentialAttribute()]
    $Credential,

    # Indicates that the cmdlet uses the credentials of the current user to send the web request.
    [Alias('UseDefaultCredential')]
    [switch]
    $UseDefaultCredentials,

    # Specifies that the cmdlet uses a proxy server for the request, rather than connecting directly to the Internet resource. Enter the URI of a network proxy server.
    [uri]
    $Proxy,

    # Specifies a user account that has permission to use the proxy server that is specified by the Proxy parameter. The default is the current user.
    # Type a user name, such as "User01" or "Domain01\User01", or enter a PSCredential object, such as one generated by the Get-Credential cmdlet.
    # This parameter is valid only when the Proxy parameter is also used in the command. You cannot use the ProxyCredential and ProxyUseDefaultCredentials parameters in the same command.
    [pscredential]
    [Management.Automation.CredentialAttribute()]
    $ProxyCredential,

    # Indicates that the cmdlet uses the credentials of the current user to access the proxy server that is specified by the Proxy parameter.
    # This parameter is valid only when the Proxy parameter is also used in the command. You cannot use the ProxyCredential and ProxyUseDefaultCredentials parameters in the same command.
    [switch]
    $ProxyUseDefaultCredentials,

    # The typename of the results.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string[]]
    $PSTypeName,

    # A set of additional properties to add to an object
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $Property,

    # A list of property names to remove from an object
    [string[]]
    $RemoveProperty,

    # If provided, will expand a given property returned from the REST api.
    [string]
    $ExpandProperty,

    # If provided, will decorate the values within a property in the return object.
    # This allows nested REST properties to work with the PowerShell Extended Type System.
    [Collections.IDictionary]
    [Alias('TypeNameOfProperty')]
    $DecorateProperty
    )

    process {
        #region Prepare Parameters
        $irmSplat = @{} + $PSBoundParameters    # First, copy PSBoundParameters and remove the parameters that aren't Invoke-RestMethod's
        $irmSplat.Remove('PersonalAccessToken') # * -PersonalAccessToken
        $irmSplat.Remove('PSTypeName') # * -PSTypeName
        $irmSplat.Remove('Property') # *-Property
        $irmSplat.Remove('RemoveProperty') # *-RemoveProperty
        $irmSplat.Remove('ExpandProperty') # *-ExpandProperty
        $irmSplat.Remove('DecorateProperty')
        if ($PersonalAccessToken) { # If there was a personal access token, set the authorization header
            if ($Headers) { # (make sure not to step on other headers).
                $irmSplat.Headers.Authorization = "Basic $([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes(":$PersonalAccessToken")))"
            }
            else {

                $irmSplat.Headers = @{ # If you were wondering, the Personal Access Token is passed like an HTTP credential,
                    Authorization = # (by setting the authorization header to Basic Base64EncodedBytesOf UserName:Password).
                        # The very slight trick is that PersonalAccessToken's don't have a username
                        "Basic $([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes(":$PersonalAccessToken")))"
                }
            }
        }
        if ($Body -and $Body -isnot [string]) { # If a body was passed, and it wasn't a string
            $irmSplat.Body = ConvertTo-Json -Depth 100 -InputObject $body # make it JSON.
        }
        if (-not $irmSplat.ContentType) { # If no content type was passed
            $irmSplat.ContentType = $ContentType # set it to the default.
        }
        #endregion Prepare Parameters

        #region Call Invoke-RestMethod
        if ($ContinuationToken) {
            if (-not $uri.Query) {
                $uri = "${uri}?ContinuationToken=$ContinuationToken"
            } else {
                $uri = "${uri}&continuationToken=$ContinuationToken"
            }    
        }

        $webRequest =  [Net.WebRequest]::Create($uri)
        $webRequest.Method = $Method
        $webRequest.contentType = $ContentType
        if ($irmSplat.Headers) {
            foreach ($h in $irmSplat.Headers.GetEnumerator()) {
                $webRequest.headers.add($h.Key, $h.Value)
            }
        }
        if ($UseDefaultCredentials) {
            $webRequest.useDefaultCredentials = $UseDefaultCredentials
        }
        elseif ($Credential) {
            $webRequest.credentials = $Credential.GetNetworkCredential()
        }

        if ($irmSplat.Body) {
            $bytes = [Text.Encoding]::UTF8.GetBytes($irmSplat.Body)
            $webRequest.contentLength = $bytes.Length
            $requestStream = $webRequest.GetRequestStream()
            $requestStream.Write($bytes, 0, $bytes.Length)
            $requestStream.Close()
        }

        $response = . {
            $webResponse = 
                try {
                    $WebRequest.GetResponse()
                } catch {
                    $ex = $_
                    if ($ex.Exception.InnerException.Response) {                            
                        $streamIn = [IO.StreamReader]::new($ex.Exception.InnerException.Response.GetResponseStream())
                        $strResponse = $streamIn.ReadToEnd()                            
                        $streamIn.Close()
                        $streamIn.Dispose()
                        Write-Error $strResponse 
                        return
                    } else {
                        $ex | Write-Error
                        return
                    }                        
                }
            $rs = $webresponse.GetResponseStream()
            $responseHeaders = $webresponse.Headers
            $responseHeaders = 
                if ($responseHeaders -and $responseHeaders.GetEnumerator()) {
                    $reHead = @{}
                    foreach ($r in $responseHeaders.GetEnumerator()) {
                        $reHead[$r] = $responseHeaders[$r]
                    }
                    $reHead
                } else {
                    $null
                }

            $streamIn = [IO.StreamReader]::new($rs)
            $strResponse = $streamIn.ReadToEnd()
            if ($webResponse.ContentType -like '*json*') {
                try {
                    $strResponse | ConvertFrom-Json
                } catch {
                    $strResponse
                }
            } else {
                $strResponse
            }
             
            $streamIn.Close()
        } 2>&1
        $null = $null
        # We call Invoke-RestMethod with the parameters we've passed in.
        # It will take care of converting the results from JSON.
        #@(try {
            $response|
        #} catch {
            #$_
        #}) |
            & { process {
                $in = $_

                # What it will not do is "unroll" them.
                # A lot of things in the Azure DevOps REST apis come back as a count/value pair
                if ($in -eq 'null') {
                    return
                }
                if ($ExpandProperty) {
                    if ($in.$ExpandProperty) {
                        $in.$ExpandProperty
                    }
                } elseif ($in.Value -and $in.Count) {  # If that's what we're dealing with
                    $in.Value # pass value down the pipe.
                } elseif ($in -notlike '*<html*') { # Otherise, As long as the value doesn't look like HTML,
                    $in # pass it down the pipe.
                } else { # If it happened to look like HTML, write an error
                    $PSCmdlet.WriteError(
                        [Management.Automation.ErrorRecord]::new(
                            [Exception]::new("Response was HTML, Request Failed."),
                            "ResultWasHTML", "NotSpecified", $in))
                    $psCmdlet.WriteVerbose("$in") # and write the full content to verbose.
                    return
                }
            } } 2>&1 |
            & { process { # One more step of the pipeline will unroll each of the values.

                if ($_ -is [string]) { return $_ }
                if ($null -ne $_.Count -and $_.Count -eq 0) { return }
                $in = $_
                if ($PSTypeName -and # If we have a PSTypeName (to apply formatting)
                    $in -isnot [Management.Automation.ErrorRecord] # and it is not an error (which we do not want to format)
                ) {
                    $in.PSTypeNames.Clear() # then clear the existing typenames and decorate the object.
                    foreach ($t in $PSTypeName) {
                        $in.PSTypeNames.add($T)
                    }
                }

                if ($Property) {
                    foreach ($propKeyValue in $Property.GetEnumerator()) {
                        if ($in.PSObject.Properties[$propKeyValue.Key]) {
                            $in.PSObject.Properties.Remove($propKeyValue.Key)
                        }
                        $in.PSObject.Properties.Add($(
                        if ($propKeyValue.Value -as [ScriptBlock[]]) {
                            [PSScriptProperty]::new.Invoke(@($propKeyValue.Key) + $propKeyValue.Value)
                        } else {
                            [PSNoteProperty]::new($propKeyValue.Key, $propKeyValue.Value)
                        }))
                    }
                }
                if ($RemoveProperty) {
                    foreach ($propToRemove in $RemoveProperty) {
                        $in.PSObject.Properties.Remove($propToRemove)
                    }
                }
                if ($DecorateProperty) {
                    foreach ($kv in $DecorateProperty.GetEnumerator()) {
                        if ($in.$($kv.Key)) {
                            foreach ($v in $in.$($kv.Key)) {
                                if ($null -eq $v -or -not $v.pstypenames) { continue }
                                $v.pstypenames.clear()
                                foreach ($tn in $kv.Value) {
                                    $v.pstypenames.add($tn)
                                }
                            }
                        }
                    }
                }
                return $in # output the object and we're done.
            } }
        #endregion Call Invoke-RestMethod

        if ($responseHeaders.'X-MS-ContinuationToken') {
            $ContinuationToken = $PSBoundParameters['ContinuationToken'] = $responseHeaders.'X-MS-ContinuationToken'
            Invoke-ADORestAPI @PSBoundParameters
        }
    }
}