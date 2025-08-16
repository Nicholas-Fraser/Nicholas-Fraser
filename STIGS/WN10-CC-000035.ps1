<#
.SYNOPSIS
    This PowerShell script prevents the computer from releasing its NetBIOS name on demand by setting NoNameReleaseOnDemand to 1 per STIG WN10-CC-000035.

.NOTES
    Author          : Nicholas Fraser
    LinkedIn        : linkedin.com/in/nfras/
    GitHub          : github.com/Nicholas-Fraser
    Date Created    : 2025-08-16
    Last Modified   : 2025-08-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run in an elevated PowerShell session.
    Example:
    PS C:\> .\STIG-ID-WN10-CC-000035.ps1
#>

# Define the registry path and value
$RegPath   = "HKLM:\SYSTEM\CurrentControlSet\Services\Netbt\Parameters"
$ValueName = "NoNameReleaseOnDemand"
$ValueData = 1  # Prevent NetBIOS name release on demand

# Ensure the registry key exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

# Verify the change
Get-ItemProperty -Path $RegPath -Name $ValueName
