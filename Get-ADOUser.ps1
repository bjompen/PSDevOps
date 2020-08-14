﻿function Get-ADOUser
{
    <#
    .Synopsis
        Gets Azure DevOps Users
    .Description
        Gets users from Azure DevOps.
    .Link
        Get-ADOTeam
    .Example
        Get-ADOUser -Organization StartAutomating
    .Link
        https://docs.microsoft.com/en-us/rest/api/azure/devops/graph/users/list?view=azure-devops-rest-5.1
    #>
    [CmdletBinding(DefaultParameterSetName='graph/users')]
    [OutputType('PSDevOps.Team','PSDevOps.TeamMember')]
    param(
    # The Organization.
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Org')]
    [string]
    $Organization,

    # The project name or identifier.
    [Parameter(Mandatory,ParameterSetName='projects/{Project}/teams/{teamId}/members',ValueFromPipelineByPropertyName)]
    [Parameter(ParameterSetName='graph/descriptors/{teamId}')]
    [string]
    $Project,

    # The Team Identifier
    [Parameter(Mandatory,ParameterSetName='projects/{Project}/teams/{teamId}/members',ValueFromPipelineByPropertyName)]
    [string]
    $TeamID,

    # The server.  By default https://dev.azure.com/.
    # To use against TFS, provide the tfs server URL (e.g. http://tfsserver:8080/tfs).
    [Parameter(ValueFromPipelineByPropertyName)]
    [uri]
    $Server = "https://dev.azure.com/",

    # The api version.  By default, 5.1-preview.
    # If targeting TFS, this will need to change to match your server version.
    # See: https://docs.microsoft.com/en-us/azure/devops/integrate/concepts/rest-api-versioning?view=azure-devops
    [string]
    $ApiVersion = "5.1-preview"
    )

    dynamicParam { . $GetInvokeParameters -DynamicParameter }

    begin {
        #region Copy Invoke-ADORestAPI parameters
        $invokeParams = . $getInvokeParameters $PSBoundParameters
        #endregion Copy Invoke-ADORestAPI parameters
    }

    process {
        $psParameterSet = $psCmdlet.ParameterSetName

        if ($psParameterSet -like 'graph*') {
            $server = 'https://vssps.dev.azure.com/'
        }

        $uri = # The URI is comprised of:
            @(
                "$server".TrimEnd('/')   # the Server (minus any trailing slashes),
                $Organization            # the Organization,
                '_apis'                  # the API Root ('_apis'),
                (. $ReplaceRouteParameter $psParameterSet)
                                         # and any parameterized URLs in this parameter set.
            ) -as [string[]] -ne '' -join '/'

        $uri += '?' # The URI has a query string containing:
        $uri += @(
            if ($Server -notlike 'https://*.azure.com/' -and
                -not $PSBoundParameters.ApiVersion) {
                $ApiVersion = '2.0'
            }
            if ($ApiVersion) { # the api-version
                "api-version=$apiVersion"
            }
        ) -join '&'

        # We want to decorate our return value.  Handily enough, both URIs contain a distinct name in the last URL segment.
        $typename = @($psParameterSet -split '/' -notlike '{*}')[-1].TrimEnd('s') -replace 'Member', 'TeamMember' # We just need to drop the 's'

        $typeNames = @(
            "$organization.$typename"
            if ($Project) { "$organization.$Project.$typename" }
            "PSDevOps.$typename"
        )
        $invokeParams.Uri = $uri
        $invokeParams.PSTypeName = $typeNames
        $invokeParams.Property = @{Organization=$Organization;Server=$Server}
        if ($Project) { $invokeParams.Property.Project = $Project }
        if ($TeamID) { $invokeParams.Property.TeamID = $TeamID}


        Invoke-ADORestAPI @invokeParams
    }
}

