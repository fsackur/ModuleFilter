function Get-AutoloadModules
{
    #Roughing out the GUI element
    param
    (
    )
    
    $Properties = (
        @{n='Autoload'; e={$true}},
        'Name',
        @{n='ModuleBase'; e={$_.ModuleBase -replace '(?<=\\)(\d+\.){0,3}\d+$'}}
    )
    Get-Module | select $Properties | sort Name, ModuleBase -Unique
}