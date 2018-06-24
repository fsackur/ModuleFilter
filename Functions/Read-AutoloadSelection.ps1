function Read-AutoloadSelection
{
    param
    (
        [Parameter(Position = 0)]
        [string]$Path = $Script:ConfigFile
    )
    
    $Config = Import-Csv $Path
    
    Write-Output $Config
}