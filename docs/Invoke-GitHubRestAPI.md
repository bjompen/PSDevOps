
Invoke-GitHubRestAPI
--------------------
### Synopsis
Invokes the Git Rest API

---
### Description

Invokes the GitHub REST API

---
### Related Links
* [Invoke-RestMethod](https://docs.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Invoke-RestMethod)
---
### Examples
#### EXAMPLE 1
```PowerShell
# Uses the Azure DevOps REST api to get builds from a project
$org = 'StartAutomating'
$repo = 'PSDevOps'
Invoke-GitRestAPI "https://api.github.com/repos/StartAutomating/PSDevOps"
```

---
### Parameters
#### **Uri**

The REST API Url



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|false   |named  |true (ByPropertyName)|
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

|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **QueryParameter**

Additional parameters provided in the query string.



|Type               |Requried|Postion|PipelineInput        |
|-------------------|--------|-------|---------------------|
|```[IDictionary]```|false   |named  |true (ByPropertyName)|
---
#### **PersonalAccessToken**

A Personal Access Token



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Page**

The page number.  If provided, will only get one page of results.
If this is not provided, additional results will be fetched until they are exhausted.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
#### **PerPage**

The number of items to retreive on a single page.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
#### **PSTypeName**

The typename of the results.
If not set, will be the depluralized last non-variable segment of a URL.
(i.e. "https://api.github.com/user/repos" would use a typename of 'repos'
so would: "https://api.github.com/users/{UserName}/repos")



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



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **AsJob**

If set, will run as a background job.
This parameter will be ignored if the caller is piping the results of Invoke-ADORestAPI.
This parameter will also be ignore when calling with -DynamicParameter or -MapParameter.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
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
#### **GitApiUrl**

The GitAPIUrl
This will used if -Uri does not contain a hostname.
It will default to $env:GIT_API_URL if it is set, otherwise 'https://api.github.com/'



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|false   |named  |true (ByPropertyName)|
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
#### **UserAgent**

Provides a custom user agent.  GitHub API requests require a User Agent.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
### Outputs
System.Management.Automation.PSObject


---
### Syntax
```PowerShell
Invoke-GitHubRestAPI [-Uri <Uri>] [-Method <String>] [-Body <Object>] [-UrlParameter <IDictionary>] [-QueryParameter <IDictionary>] [-PersonalAccessToken <String>] [-Page <Int32>] [-PerPage <Int32>] [-PSTypeName <String[]>] [-Property <IDictionary>] [-RemoveProperty <String[]>] [-ExpandProperty <String>] [-DecorateProperty <IDictionary>] [-Cache] [-AsJob] [-GitApiUrl <Uri>] [-ContentType <String>] [-Headers <IDictionary>] [-UserAgent <String>] [<CommonParameters>]
```
```PowerShell
Invoke-GitHubRestAPI [-PersonalAccessToken <String>] [-Cache] [-AsJob] -DynamicParameter [<CommonParameters>]
```
```PowerShell
Invoke-GitHubRestAPI [-PersonalAccessToken <String>] [-Cache] [-AsJob] -MapParameter <IDictionary> [<CommonParameters>]
```
---


