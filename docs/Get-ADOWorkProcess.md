
Get-ADOWorkProcess
------------------
### Synopsis
Gets work processes from ADO.

---
### Description

Gets work processes from Azure DevOps.

---
### Related Links
* [https://docs.microsoft.com/en-us/rest/api/azure/devops/processes/processes/list?view=azure-devops-rest-5.1](https://docs.microsoft.com/en-us/rest/api/azure/devops/processes/processes/list?view=azure-devops-rest-5.1)
---
### Examples
#### EXAMPLE 1
```PowerShell
Get-ADOWorkProcess -Organization StartAutomating -PersonalAccessToken $pat
```

#### EXAMPLE 2
```PowerShell
Get-ADOProject -Organization StartAutomating -PersonalAccessToken $pat | Get-ADOWorkProcess
```

---
### Parameters
#### **Organization**

The Organization



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **ProjectID**

The Project Identifier.  If this is provided, will get the work process associated with that project.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **ProcessID**

The process identifier



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **WorkItemType**

If set, will list work item types in a given Work process.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **Behavior**

If set, will list behaviors associated with a given work process.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **Server**

The server.  By default https://dev.azure.com/.
To use against TFS, provide the tfs server URL (e.g. http://tfsserver:8080/tfs).



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|false   |named  |true (ByPropertyName)|
---
#### **ApiVersion**

The api version.  By default, 5.1.
If targeting TFS, this will need to change to match your server version.
See: https://docs.microsoft.com/en-us/azure/devops/integrate/concepts/rest-api-versioning?view=azure-devops



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
### Outputs
PSDevOps.WorkProcess


---
### Syntax
```PowerShell
Get-ADOWorkProcess -Organization <String> [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADOWorkProcess -Organization <String> -ProjectID <String> [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADOWorkProcess -Organization <String> -ProcessID <String> -Behavior [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADOWorkProcess -Organization <String> -ProcessID <String> -WorkItemType [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADOWorkProcess -Organization <String> -ProcessID <String> [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
---


