function Read-AutoloadSelection
{
    param
    (
        [Parameter(Position = 0)]
        [string]$Path = $Script:ConfigFile
    )
    
    $Config = Import-Csv $Path
    $Config | foreach {$_.ShouldAutoload = [Convert]::ToBoolean($_.ShouldAutoload)}
    
    Write-Output $Config
}