#Requires -Version 3
<#
.SYNOPSIS
  <Verify the .apk (or .aab) file is signed>
.DESCRIPTION
  <Verify the .apk (or .aab) file is signed>
.PARAMETER <PackagePath>
    <Path to .apk or .aab file>
.INPUTS
  <None>
.OUTPUTS
  <None>
.NOTES
  Version:        0.1
  Author:         <Max Kaye>
  Creation Date:  <2020-05-18>
  Purpose/Change: Verify signature on .apk or .aab files
  
  Boilerplate borrowed from: https://gist.github.com/maxfunke/d801858b2a1b01714dcb0193c188ee28
  
.EXAMPLE
  .\check-signature.ps1 .\path\to\my\app-release.apk
#>


#--------[Params]---------------
Param(
  [parameter(Mandatory=$True,ValueFromPipeline=$false)] $PackagePath
)

#if (-not($PSBoundParameters.ContainsKey("MyParam"))) {
#   Write-Output "Value from pipeline"
#}

#--------[Script]---------------


Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$scriptDir = Split-Path -LiteralPath $PSCommandPath
$startingLoc = Get-Location
Set-Location $scriptDir
$startingDir = [System.Environment]::CurrentDirectory
[System.Environment]::CurrentDirectory = $scriptDir


try
{
	# just use the "default" (i.e. "my") path - YMMV
    & 'C:\Program Files (x86)\Java\jre1.8.0_211\bin\keytool.exe' -printcert -jarfile $startingLoc\$PackagePath
}
finally
{
    Set-Location $startingLoc
    [System.Environment]::CurrentDirectory = $startingDir
    Write-Output "Done. Elapsed time: $($stopwatch.Elapsed)"
}