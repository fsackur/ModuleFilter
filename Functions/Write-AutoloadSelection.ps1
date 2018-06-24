function Write-AutoloadSelection
{
    param
    (
        [Parameter(Mandatory, Position = 0)]
        [psobject[]]$Config,

        [Parameter(Position = 1)]
        [string]$Path = $Script:ConfigFile
    )
    
    $Config | select ShouldAutoload, Name, ModuleBase | Export-Csv $Path
}