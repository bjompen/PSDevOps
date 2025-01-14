
Write-ADOOutput
---------------
### Synopsis
Writes ADO Output

---
### Description

Writes formal Output to a ADO step.

This output can be referenced in subsequent steps within a job.

---
### Related Links
* [Write-ADOError](Write-ADOError.md)
* [Write-ADODebug](Write-ADODebug.md)
* [Write-ADOWarning](Write-ADOWarning.md)
---
### Examples
#### EXAMPLE 1
```PowerShell
Write-ADOOutput @{
    key = 'value'
}
```

#### EXAMPLE 2
```PowerShell
Get-Random -Minimum 1 -Maximum 10 | Write-ADOOutput -Name RandomNumber
```

---
### Parameters
#### **InputObject**

The InputObject.  Values will be converted to a JSON array.



|Type            |Requried|Postion|PipelineInput |
|----------------|--------|-------|--------------|
|```[PSObject]```|true    |1      |true (ByValue)|
---
#### **Name**

The Name of the Output.  By default, 'Output'.



|Type          |Requried|Postion|PipelineInput|
|--------------|--------|-------|-------------|
|```[String]```|false   |2      |false        |
---
#### **Depth**

The JSON serialization depth.  By default, 10 levels.



|Type         |Requried|Postion|PipelineInput|
|-------------|--------|-------|-------------|
|```[Int32]```|false   |3      |false        |
---
### Outputs
System.String


---
### Syntax
```PowerShell
Write-ADOOutput [-InputObject] <PSObject> [[-Name] <String>] [[-Depth] <Int32>] [<CommonParameters>]
```
---


