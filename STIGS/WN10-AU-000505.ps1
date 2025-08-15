<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Security event log is at least 1,024,000 KB (1000 MB).

.NOTES
    Author          : Nicholas Fraser
    LinkedIn        : linkedin.com/in/nfras/
    GitHub          : github.com/Nicholas-Fraser
    Date Created    : 2025-08-15
    Last Modified   : 2025-08-15
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000505.ps1
#>

# Define the registry path and value
$RegPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$ValueName = "MaxSize"
$ValueData = 0x000FA000  # 1,024,000 KB (1000 MB)

# Ensure the registry key exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

# Verify the change
Get-ItemProperty -Path $RegPath -Name $ValueName
