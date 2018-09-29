function Get-AvailableModules
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [switch]$Unique
    )

    $AvailableModules = Get-Module -ListAvailable -Refresh

    if (-not $Unique)
    {
        return $AvailableModules
    }



    $InstallFolderSelector = {
        Split-Path -Parent $_.Path | foreach {
            if ([Version]::TryParse((Split-Path $_ -Leaf), [ref]$null))
            {
                Split-Path -Parent $_
            }
            else {$_}

        } | Split-Path -Parent
    }

    $ModuleSearchPathPreferenceIndexer = {
        $SearchPaths = $env:PSModulePath -split '\\?;'
        $Index = $SearchPaths.IndexOf($_.SearchPath)    # -1 if module wasn't loaded from PSModulePath, 0 if loaded from first folder in PSModulePath, etc
        -$Index                                         # Prefer independently loaded, then in order of first PSModulePath folder module is found in
    }


    $AvailableModules |
        select (
            @{Name = 'ModuleInfo'; Expression = {$_}},                      # Add the original object, to return after logic processing
            'Name',
            'Version',
            @{Name = 'SearchPath'; Expression = $InstallFolderSelector}     # Add the parent path, which may be in the PSModulePath
        ) |
            select (
            'ModuleInfo',
            'Name',
            'Version',
            @{Name = 'ModuleSearchPathPreferenceIndex'; Expression = $ModuleSearchPathPreferenceIndexer}    # Rank by order of index in the PSModulePath
        ) |
            group Name |
            foreach {
            $_.Group | sort 'Version', 'ModuleSearchPathPreferenceIndex' | select -Last 1 -ExpandProperty 'ModuleInfo'
        }

}