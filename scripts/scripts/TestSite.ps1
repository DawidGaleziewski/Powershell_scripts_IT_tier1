

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Check server'
$msg   = 'Enter abbreviation for site:'

$abr = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)





$cinema="uc"+ $abr +"p-viscin1" 
$iptarget= [System.Net.Dns]::GetHostAddresses("$cinema“)
$3rdOctet= $iptarget.ipaddresstostring.split(".")[2]



###Test elements

$router1= "10.200." + $3rdOctet + ".1"
$router2= "10.200." + $3rdOctet + ".11"
$fw= "10.201." + $3rdOctet + ".1"
$fwr="10.200." + $3rdOctet + ".2"
$esx1= "10.201." + $3rdOctet + ".3"
$idrac="10.201." + $3rdOctet + ".2"
$dc1= "10.203." + $3rdOctet + ".4"
$dc2= "10.202." + $3rdOctet + ".4"

$testviscin1= Test-Connection $iptarget.ipaddresstostring
$Testrouter1= Test-Connection $router1
$Testrouter2= Test-Connection $router2
$Testfw= Test-Connection $fw
$Testfwr= Test-Connection $fwr
$Testdc1= Test-Connection $dc1
$Testdc2= Test-Connection $dc2
$testesx1= Test-Connection   $esx1
$testidrac= Test-Connection $idrac





 $vm= $iptarget.ipaddresstostring
$iis = get-wmiobject Win32_Service -ComputerName $vm -Filter "name='w3svc'"
 




 $vm= $iptarget.ipaddresstostring
$sqlserveragent = get-wmiobject Win32_Service -ComputerName $vm -Filter "name='sqlserveragent'"





##router1
$Testrouter1 | ForEach-Object {$r1+="-"}
"Router1 status " + $r1

##router2
$Testrouter2 | ForEach-Object {$r2+="-"}
"Router2 status " + $r2

##fw
$Testfw | ForEach-Object {$f2+="-"}
"Fw inner status (connection from switch to firewall ) " + $f2

$Testfwr | ForEach-Object {$fr2+="-"}
"Fw outer status (connection from router to firewall ) " + $fr2

##dc1
$Testdc1 | ForEach-Object {$d1+="-"}
"dc1 status " + $d1

##dc2
$Testdc2 | ForEach-Object {$d2+="-"}
"dc1 status " + $d2

##esx1
$Testesx1 | ForEach-Object {$e1+="-"}
"esx1 status " + $e1

$testidrac | ForEach-Object {$i1+="-"}

"idrac status " + $i1




$testviscin1 | ForEach-Object {$v1+="-"}

"Viscin1 status " + $v1

if($iis.State -eq "Running")
{Write-Host "IIS is running on $vm"}
 
else
{Write-Host "IIS is not running on $vm"}
 
if($sqlserveragent.State -eq "Running")
{Write-Host "sqlserveragent is running on $vm"}
 
else
{Write-Host "sqlserveragent is not running on $vm"}