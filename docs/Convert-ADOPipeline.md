
Convert-ADOPipeline
-------------------
### Synopsis
Converts builds to Azure DevOps Pipelines

---
### Description

Converts builds TFS or "Classic" builds to Azure DevOps YAML Pipelines.

---
### Related Links
* [New-ADOPipeline](New-ADOPipeline.md)
* [Get-ADOTask](Get-ADOTask.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
$taskList = (Get-ADOTask -Server $tfsRootUrl -Org $projectCollectionName)
Get-ADOBuild -Definition -Server $tfsRootUrl -Org $projectCollection |
    Convert-ADOPipeline -TaskList $taskList
```

---
### Parameters
#### **BuildStep**

A list of build steps.
This will be automatically populated when piping in a TFS Build definition.



|Type              |Requried|Postion|PipelineInput        |
|------------------|--------|-------|---------------------|
|```[PSObject[]]```|true    |1      |true (ByPropertyName)|
---
#### **BuildVariable**

An object containing build variables.
This will be automatically populated when piping in a TFS build definition.



|Type            |Requried|Postion|PipelineInput        |
|----------------|--------|-------|---------------------|
|```[PSObject]```|false   |2      |true (ByPropertyName)|
---
#### **TaskList**

A list of task definitions.  This will normally be the output from Get-ADOTask.



|Type              |Requried|Postion|PipelineInput|
|------------------|--------|-------|-------------|
|```[PSObject[]]```|true    |3      |false        |
---
#### **WhereFore**

A dictionary of conditional transformations.



|Type               |Requried|Postion|PipelineInput|
|-------------------|--------|-------|-------------|
|```[IDictionary]```|false   |4      |false        |
---
#### **Passthru**

If set, will output the dictionary used to create each pipeline.
If not set, will output the pipeline YAML.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[Switch]```|false   |named  |false        |
---
### Outputs
System.String


System.Management.Automation.PSObject


---
### Syntax
```PowerShell
Convert-ADOPipeline [-BuildStep] <PSObject[]> [[-BuildVariable] <PSObject>] [-TaskList] <PSObject[]> [[-WhereFore] <IDictionary>] [-Passthru] [<CommonParameters>]
```
---


