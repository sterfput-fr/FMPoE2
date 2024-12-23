# Define variables
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition # Get the directory of the script
$besPath = Join-Path $scriptDir "BES\BES.exe" # BES.exe located in the BES subfolder within the script's directory
$limit = 10 # Set to 0 if you do not want to limit CPU usage
$setAffinity = $true # Set to $false if you do not want to set the affinity
$steamUrl = "steam://rungameid/2694490" # Steam URL to launch Path of Exile
$delayTime = 10 # Delay time in seconds to wait for the game to start

# Launch Path of Exile using Steam URL
Start-Process -FilePath $steamUrl
Start-Sleep -Seconds $delayTime # Wait for the game to start

# Define the process name
$processName = "PathOfExileSteam"

# Get the process
$process = Get-Process -Name $processName

# Check if the process is found
if ($process) {
    # Get the executable path of the process
    $exePath = $process.Path

    if ($setAffinity) {
        # Calculate the affinity mask to exclude CPU 0 and 1
        $affinityMask = [math]::pow(2, [Environment]::ProcessorCount) - 1 - 3

        # Convert affinity mask to IntPtr
        $affinityMask = [IntPtr]::new([int]$affinityMask)

        # Set the processor affinity
        $process.ProcessorAffinity = $affinityMask

        Write-Output "Processor affinity set for $processName"
    }

    # Skip BES if the limit is 0
    if ($limit -ne 0) {
        # Limit CPU usage using BES
        Start-Process -FilePath $besPath -ArgumentList "`"$exePath`" $limit --minimize"

        Write-Output "CPU usage limited for $processName"
    } else {
        Write-Output "CPU usage limit not set for $processName"
    }
} else {
    Write-Output "Process $processName not found"
}