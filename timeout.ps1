#requires -Version 2 
 
$maximumRuntimeSeconds = 21600
 
$process = Start-Process -FilePath powershell.exe -ArgumentList '-Command Start-Sleep -Seconds 21600' -PassThru 
 
try 
{
    $process | Wait-Process -Timeout $maximumRuntimeSeconds -ErrorAction Stop 
    Write-Warning -Message 'Process successfully completed within timeout.' 
}
catch 
{
    Write-Warning -Message 'Process exceeded timeout, will be killed now.' 
    $process | Stop-Process -Force 
} 
