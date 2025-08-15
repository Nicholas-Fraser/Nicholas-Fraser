<#
.SYNOPSIS
    This PowerShell script disables the lock screen slideshow per STIG WN10-CC-000010.

.NOTES
    Author          : Nicholas Fraser
    LinkedIn        : linkedin.com/in/nfras/
    GitHub          : github.com/Nicholas-Fraser
    Date Created    : 2025-08-15
    Last Modified   : 2025-08-15
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\STIG-ID-WN10-CC-000010.ps1
#>

# Define the registry path and value
$RegPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$ValueName = "NoLockScreenSlideshow"
$ValueData = 1  # Disable lock screen slideshow

# Ensure the registry key exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

# Verify the change
Get-ItemProperty -Path $RegPath -Name $ValueName
