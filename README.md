# Path of Exile CPU Affinity and Usage Limiter Script

This PowerShell script, named **Fix My PoE2**, is designed to help resolve the issue of Path of Exile 2 (POE2) crashing when loading a zone. It launches Path of Exile via Steam, sets the CPU affinity to exclude CPU 0 and 1, and limits the CPU usage using BES (Battle Encoder Shirase). 
Both CPU affinity and usage limitation are configurable.

## How to Use

1. **Configure the Script**: Open the script file `poe2.ps1` and adjust the following variables if necessary:
    - `$limit`: Set the CPU usage limit percentage (1-99). Set to `0` if you do not want to limit CPU usage.
    - `$setAffinity`: Set to `$false` if you do not want to set the CPU affinity.
    - `$steamUrl`: The Steam URL to launch Path of Exile (`steam://rungameid/2694490`).
    - `$delayTime`: The delay time in seconds to wait for the game to start before applying settings.

2. **Run the Script**: Execute the script using PowerShell. Make sure to run PowerShell as an administrator to allow the script to modify process settings.

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force; .\poe2.ps1
    ```

3. **BONUS Create a Shortcut**:
    - Right-click on the desktop and select **New > Shortcut**.
    - For the location of the item, enter the path to `powershell.exe` followed by the path to your script, for example:
      ```
      C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Users\Myname\Desktop\Path Of Exiles 2\poe2.ps1"
      ```
    - Click **Next** and give your shortcut a name, such as "Fix My POE2".
    - Click **Finish**.
    - Right-click on the newly created shortcut and select **Properties**.
    - Click on the **Advanced** button and check the box **Run as administrator**.
    - Click **OK** to close the Advanced Properties window.
    - Click on the **Change Icon** button and browse to the location of your icon.
    - Select the icon and click **OK**.

## Script Details

- The script launches Path of Exile using the specified Steam URL.
- It waits for the specified delay time to allow the game to start.
- It retrieves the process information for Path of Exile.
- If `$setAffinity` is set to `$true`, it sets the CPU affinity to exclude CPU 0 and 1.
- If `$limit` is not `0`, it uses BES to limit the CPU usage of Path of Exile.

## Credits

- This script uses [BES (Battle Encoder Shirase)](https://mion.yosei.fi/BES/) to limit CPU usage.
