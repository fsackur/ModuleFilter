
@{
    RootModule           = 'Prune.psm1'
    ModuleVersion        = '0.1'
    GUID                 = '8bb13c28-bf1a-40d2-a997-8a58360194c4'

    Author               = 'Freddie Sackur'
    CompanyName          = 'dustyfox.uk'
    Copyright            = 'Copyright (c) 2018 Freddie Sackur'

    Description          = 'Filter module auto-loading to only your choice of installed modules. This helps with performance and simplicity.'

    PowerShellVersion    = '3.0'
    RequiredModules      = @()

    FunctionsToExport    = @(
        'Get-AutoloadModules',
        'New-Autoload',
        'Read-AutoloadSelection',
        'Select-AutoloadModules',
        'Write-AutoloadSelection'
    )
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @()
    DscResourcesToExport = @()

    PrivateData          = @{

        PSData = @{

            Tags       = @(
                'Prune',
                'Filter',
                'Autoload',
                'ModulePath',
                'PSModulePath'
            )

            LicenseUri = 'https://raw.githubusercontent.com/fsackur/Prune/master/LICENSE'
            ProjectUri = 'https://github.com/fsackur/Prune'
        }
    }
}
