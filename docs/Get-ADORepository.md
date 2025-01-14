
Get-ADORepository
-----------------
### Synopsis
Gets repositories from Azure DevOps

---
### Description

Gets the repositories from Azure DevOps.

By default, this will return the project's git repositories.

You can get additional details by piping back into Get-ADORepository with a number of switches:

* ```Get-ADORepository | Get-ADORepository -PullRequest # Lists pull requests```
* ```Get-ADORepository | Get-ADORepository -FileList    # Lists files in a repository```
* ```Get-ADORepository | Get-ADORepository -GitRef      # Lists git refs for a repository```


Azure DevOps repositories can have more than one type of SourceProvider.

To list the Source Providers, use -SourceProvider

We can get repositories for a given -ProviderName.

---
### Related Links
* [Remove-ADORepository](Remove-ADORepository.md)
* [https://docs.microsoft.com/en-us/rest/api/azure/devops/build/source%20providers/list%20repositories](https://docs.microsoft.com/en-us/rest/api/azure/devops/build/source%20providers/list%20repositories)
---
### Examples
#### EXAMPLE 1
```PowerShell
Get-ADORepository -Organization StartAutomating -Project PSDevOps
```

---
### Parameters
#### **Organization**

The Organization



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **Project**

The Project



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **RepositoryID**

The Repository ID



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **CommitList**

If set, will list commits associated with a given repository.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|true    |named  |false        |
---
#### **Skip**

If provided, will -Skip N items.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
#### **First**

If provided, will return the -First N items.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |named  |false        |
---
#### **FileList**

If set, will get the file list from a repository



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **RecursionLevel**

When getting a -FileList, the recursion level.  By default, full.



Valid Values:

* full
* None
* oneLevel
* oneLevelPlusNestedEmptyFolders
|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **ScopePath**

When getting a -FileList, the path scope.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **VersionDescriptor**

The version string identifier (name of tag/branch, SHA1 of commit)



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **VersionOption**

The version options (e.g. firstParent, previousChange)



Valid Values:

* none
* firstParent
* previousChange
|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **VersionType**

The version type (e.g. branch, commit, or tag)



Valid Values:

* branch
* commit
* tag
|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **IncludeMetadata**

If -IncludeContentMetadata is set a -FileList will include content metadata.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **Download**

If set, will include the parent repository



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **PullRequest**

If set, will list pull requests related to a git repository.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **GitRef**

If set, will list git references related to a repository.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **BranchStatistic**

If set, will list git branch statistics related to a repository.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **TreeId**

If provided, will output a tree of commits.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **CreatorIdentity**

Filters pull requests, returning requests created by the -CreatorIdentity.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **ReviewerIdentity**

Filters pull requests where the -ReviewerIdentity is a reviewer.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **SourceReference**

Filters pull requests where the source branch is the -SourceReference.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **TargetReference**

Filters pull requests where the target branch is the -TargetReference.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **PullRequestStatus**

Filters pull requests with a paricular status.  If not specified, will default to Active.



Valid Values:

* abandoned
* active
* all
* completed
* notset
|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **PullRequestID**

Get pull request with a specific id



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **PushList**

If set, will list pushes associated with a repository



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **IncludeParent**

If set, will include the parent repository



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|false   |named  |true (ByPropertyName)|
---
#### **Recycled**

If set, will get repositories from the recycle bin



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **IncludeHidden**

If set, will include hidden repositories.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **IncludeLink**

If set, will include all related links to a repository.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **IncludeRemoteUrl**

If set, will return all GitHub remote URLs associated with a repository.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
#### **SourceProvider**

If set, will list repository source providers



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[Switch]```|true    |named  |true (ByPropertyName)|
---
#### **ProviderName**

The name of the Source Provider.  This will get all repositories associated with the project.
If the -ProviderName is not TFVC or TFGit, an -EndpointID is also required



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **EndpointID**

The name of the Source Provider.  This will get all repositories associated with the project.
If the -ProviderName is not TFVC or TFGit, an -EndpointID is also required



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **RepositoryName**

The name of the repository



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **Path**

The path within the repository.
To use this parameter, -ProviderName is also required, and -EndpointID will be required if the -ProviderName is not TFVC or TFGit



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|true    |named  |true (ByPropertyName)|
---
#### **CommitOrBranch**

The commit or branch.  By default, Master.



|Type          |Requried|Postion|PipelineInput        |
|--------------|--------|-------|---------------------|
|```[String]```|false   |named  |true (ByPropertyName)|
---
#### **Server**

The server.  By default https://dev.azure.com/.
To use against TFS, provide the tfs server URL (e.g. http://tfsserver:8080/tfs).



|Type       |Requried|Postion|PipelineInput        |
|-----------|--------|-------|---------------------|
|```[Uri]```|false   |named  |true (ByPropertyName)|
---
#### **ApiVersion**

The api version.  By default, 5.1-preview.
If targeting TFS, this will need to change to match your server version.
See: https://docs.microsoft.com/en-us/azure/devops/integrate/concepts/rest-api-versioning?view=azure-devops



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |named  |false        |
---
### Outputs
PSDevOps.Repository


PSDevOps.Repository.SourceProvider


PSDevOps.Repository.File


PSDevOps.Repoistory.Recycled


---
### Syntax
```PowerShell
Get-ADORepository -Organization <String> -Project <String> [-IncludeHidden] [-IncludeLink] [-IncludeRemoteUrl] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> -TreeId <String> [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> -BranchStatistic [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> [-First <Int32>] -GitRef [-IncludeLink] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> [-Skip <Int32>] [-First <Int32>] -PushList [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> -PullRequestID <String> [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> [-Skip <Int32>] [-First <Int32>] -PullRequest [-CreatorIdentity <String>] [-ReviewerIdentity <String>] [-SourceReference <String>] [-TargetReference <String>] [-PullRequestStatus <String>] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> -FileList [-RecursionLevel <String>] [-ScopePath <String>] [-VersionDescriptor <String>] [-VersionOption <String>] [-VersionType <String>] [-IncludeMetadata] [-Download] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> -CommitList [-Skip <Int32>] [-First <Int32>] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -RepositoryID <String> [-IncludeParent] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -Recycled [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -SourceProvider [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -ProviderName <String> [-EndpointID <String>] -RepositoryName <String> -Path <String> [-CommitOrBranch <String>] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
```PowerShell
Get-ADORepository -Organization <String> -Project <String> -ProviderName <String> [-EndpointID <String>] [-Server <Uri>] [-ApiVersion <String>] [<CommonParameters>]
```
---


