
Invoke-ADORestAPI
-----------------
### Synopsis
Invokes the ADO Rest API

---
### Description

Invokes the Azure DevOps REST API

---
### Related Links
* [Invoke-RestMethod](https://docs.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Invoke-RestMethod)
---
### Examples
#### EXAMPLE 1
```PowerShell
# Uses the Azure DevOps REST api to get builds from a project
$org = 'StartAutomating'
$project = 'PSDevOps'
Invoke-ADORestAPI "https://dev.azure.com/$org/$project/_apis/build/builds/?api-version=5.1"
```

---
### Parameters
#### **Uri**

The REST API Url



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|true    |1      |true (ByPropertyName)|
---
#### **Method**

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



Valid Values:

* GET
* DELETE
* HEAD
* MERGE
* OPTIONS
* PATCH
* POST
* PUT
* TRACE
|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Body**

Specifies the body of the request.
If this value is a string, it will be passed as-is
Otherwise, this value will be converted into JSON.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Object]```|false   |named  |true (ByPropertyName)|
---
#### **UrlParameter**

Parameters provided as part of the URL (in segments or a query string).



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **QueryParameter**

Additional parameters provided after the URL.



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **ContentType**

Specifies the content type of the web request.
If this parameter is omitted and the request method is POST, Invoke-RestMethod sets the content type to application/x-www-form-urlencoded. Otherwise, the content type is not specified in the call.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Headers**

Specifies the headers of the web request. Enter a hash table or dictionary.



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **PersonalAccessToken**

A Personal Access Token



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
#### **Credential**

Specifies a user account that has permission to send the request. The default is the current user.
Type a user name, such as User01 or Domain01\User01, or enter a PSCredential object, such as one generated by the Get-Credential cmdlet.



|Type                |Requried|Postion|PipelineInput|
|--------------------|--------|-------|-------------|
|```[PSCredential]```|false   |named  |false        |
---
#### **UseDefaultCredentials**

Indicates that the cmdlet uses the credentials of the current user to send the web request.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **ContinuationToken**

A continuation token.  This is appended as a query parameter, and can be used to continue a request.
Invoke-ADORestAPI will call recursively invoke itself until a response does not have a ContinuationToken



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **PSTypeName**

The typename of the results.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[String[]]```|false   |named  |true (ByPropertyName)|
---
#### **Property**

A set of additional properties to add to an object



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **RemoveProperty**

A list of property names to remove from an object



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[String[]]```|false   |named  |true (ByPropertyName)|
---
#### **ExpandProperty**

If provided, will expand a given property returned from the REST api.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **DecorateProperty**

If provided, will decorate the values within a property in the return object.
This allows nested REST properties to work with the PowerShell Extended Type System.



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **Cache**

If set, will cache results from a request.  Only HTTP GET results will be cached.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **AsByte**

If set, will return results as a byte array.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **AsJob**

If set, will run as a background job.
This parameter will be ignored if the caller is piping the results of Invoke-ADORestAPI.
This parameter will also be ignore when calling with -DynamicParameter or -MapParameter.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **DynamicParameter**

If set, will get the dynamic parameters that should be provided to any function that wraps Invoke-ADORestApi



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **MapParameter**

If set, will return the parameters for any function that can be passed to Invoke-ADORestApi.
Unmapped parameters will be added as a noteproperty of the returned dictionary.



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|true    |named  |true (ByPropertyName)|
---
### Outputs
System.Management.Automation.PSObject


---
### Syntax
```PowerShell
Invoke-ADORestAPI [-Uri] <Uri> [-Method <String>] [-Body <Object>] [-UrlParameter <IDictionary>] [-QueryParameter <IDictionary>] [-ContentType <String>] [-Headers <IDictionary>] [-PersonalAccessToken <String>] [-Credential <PSCredential>] [-UseDefaultCredentials] [-ContinuationToken <String>] [-PSTypeName <String[]>] [-Property <IDictionary>] [-RemoveProperty <String[]>] [-ExpandProperty <String>] [-DecorateProperty <IDictionary>] [-Cache] [-AsByte] [-AsJob] [<CommonParameters>]
```
```PowerShell
Invoke-ADORestAPI [-PersonalAccessToken <String>] [-Credential <PSCredential>] [-UseDefaultCredentials] [-Cache] [-AsByte] [-AsJob] -DynamicParameter [<CommonParameters>]
```
```PowerShell
Invoke-ADORestAPI [-PersonalAccessToken <String>] [-Credential <PSCredential>] [-UseDefaultCredentials] [-Cache] [-AsByte] [-AsJob] -MapParameter <IDictionary> [<CommonParameters>]
```
---


