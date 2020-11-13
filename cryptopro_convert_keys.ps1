#######################################################################
# Author: Usil Gang
# 05-11-2018
#######################################################################
#$regPathSrc = "HKLM:\SOFTWARE\Wow6432Node\Crypto Pro\Settings\Users\{SID}\Keys\test_keys"
#$regPathDest = "HKLM:\SOFTWARE\Wow6432Node\Crypto Pro\Settings\Users\{SID}\Keys\test_keys1"
#Convert -Src $regPathSrc -Dst "D:\24257682.000" -What 0
#Convert -Src "D:\24257682.000" -Dst $regPathDest -what 1

param ($var1, $var2, $var3)

function ConvertB2F($Src,$Dst){
	$ValueName = "header.key"
	[IO.File]::WriteAllBytes("$Dst\$ValueName",$(Get-ItemProperty -Path $Src -Name $ValueName).$ValueName)
	$ValueName = "masks.key"
	[IO.File]::WriteAllBytes("$Dst\$ValueName",$(Get-ItemProperty -Path $Src -Name $ValueName).$ValueName)
	$ValueName = "masks2.key"
	[IO.File]::WriteAllBytes("$Dst\$ValueName",$(Get-ItemProperty -Path $Src -Name $ValueName).$ValueName)
	$ValueName = "name.key"
	[IO.File]::WriteAllBytes("$Dst\$ValueName",$(Get-ItemProperty -Path $Src -Name $ValueName).$ValueName)
	$ValueName = "primary.key"
	[IO.File]::WriteAllBytes("$Dst\$ValueName",$(Get-ItemProperty -Path $Src -Name $ValueName).$ValueName)
	$ValueName = "primary2.key"
	[IO.File]::WriteAllBytes("$Dst\$ValueName",$(Get-ItemProperty -Path $Src -Name $ValueName).$ValueName)
}

function ConvertF2B($Src,$Dst){
	$ValueName = "header.key"
	$Value = [IO.File]::ReadAllBytes("$Src\$ValueName")
	New-ItemProperty -Path $Dst -Name $ValueName -PropertyType Binary -Value ([byte[]]$Value)
	$ValueName = "masks.key"
	$Value = [IO.File]::ReadAllBytes("$Src\$ValueName")
	New-ItemProperty -Path $Dst -Name $ValueName -PropertyType Binary -Value ([byte[]]$Value)
	$ValueName = "masks2.key"
	$Value = [IO.File]::ReadAllBytes("$Src\$ValueName")
	New-ItemProperty -Path $Dst -Name $ValueName -PropertyType Binary -Value ([byte[]]$Value)
	$ValueName = "name.key"
	$Value = [IO.File]::ReadAllBytes("$Src\$ValueName")
	New-ItemProperty -Path $Dst -Name $ValueName -PropertyType Binary -Value ([byte[]]$Value)
	$ValueName = "primary.key"
	$Value = [IO.File]::ReadAllBytes("$Src\$ValueName")
	New-ItemProperty -Path $Dst -Name $ValueName -PropertyType Binary -Value ([byte[]]$Value)
	$ValueName = "primary2.key"
	$Value = [IO.File]::ReadAllBytes("$Src\$ValueName")
	New-ItemProperty -Path $Dst -Name $ValueName -PropertyType Binary -Value ([byte[]]$Value)
}

function Convert($Src,$Dst,$What){
	if($What -eq 0){
		ConvertB2F -Src $Src -Dst $Dst
	}
	if($What -eq 1){
		ConvertF2B -Src $Src -Dst $Dst
	}
}

Convert -Src $var1 -Dst $var2 -what $var3