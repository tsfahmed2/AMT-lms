<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2017 v5.4.138
	 Created on:   	5/21/2017 12:05 AM
	 Created by:   	tausifkhan
	 Organization: 	FICO
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
$ErrorActionPreference = "SilentlyContinue"

$ServiceName = "LMS"
$Service = Get-WmiObject -Class Win32_Service -Filter "Name='$ServiceName'"
if ($Service)
{
	write-host "noncompliant"
	$EXECUTABLE_LOCATION = "${env:ProgramFiles(x86)}\Intel\Intel(R) Management Engine Components\LMS"
	$EXECUTABLE_NAME = "LMS.exe"
	$LMS = "$EXECUTABLE_LOCATION\$EXECUTABLE_NAME"
	Stop-Service LMS
	Start-Process sc.exe -arg "delete LMS"
	
	if (Test-Path -Path "$EXECUTABLE_LOCATION\$EXECUTABLE_NAME")
	{
		Rename-Item $LMS -NewName "oldlms.exe"
	}
}
else
{
	write-host "compliant"
}

