$IPAddress = Read-Host "What is the IP Address? "
$SubnetMask = Read-Host "What is the subnet mask in CIDR format? "
$Gateway = Read-Host "What is the gateway? "
$Host_Name = Read-Host "What is the hostname? "
$DNSServers = Read-Host "What are the DNS Server addresses separated by commas? "

New-NetIPAddress -IPAddress $IPAddress -PrefixLength $SubnetMask -DefaultGateway $Gateway -InterfaceAlias Ethernet | Set-DnsClientServerAddress -ServerAddresses $DNSServers
Rename-Computer -NewName $Host_Name -Restart
