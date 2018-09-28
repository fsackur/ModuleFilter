function New-Autoload
{
    #Roughing out the GUI element
    param
    (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$Module
    )
    
    process
    {
        $ModuleInfo = Get-Module $Module -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
        if (-not $ModuleInfo) {throw "$Module not found"}
        $ModuleBase = $ModuleInfo.ModuleBase
        $ModuleName = $ModuleInfo.Name

        if ((Split-Path $ModuleBase -Leaf) -match '^(\d+\.){2,3}\d+$')
        {
            $ModuleBase = Split-Path $ModuleBase
        }

        $AutoloadBase = ($env:PSModulePath -split ';' -match 'Autoload')[0]
        $Junction = Join-Path $AutoloadBase $ModuleName

        & (Join-Path (Join-Path $MyInvocation.MyCommand.Module.ModuleBase 'Resource') 'junction.exe') $Junction $ModuleBase
    }
}