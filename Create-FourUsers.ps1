$pwd = ConvertTo-SecureString 'Pa11word' -AsPlainText -Force
$DomainUser = 'contoso\administrator'
$DomainAuth = New-Object System.Management.Automation.PSCredential($DomainUser,$pwd)

$ServerName = Get-VM | Select-Object -ExpandProperty Name | Out-GridView -Title "Choose your DC" -PassThru

Invoke-Command -VMName $ServerName -Credential $domainAuth -ScriptBlock {
    
   $uoneAttributes = @{

   Enabled = $true
   ChangePasswordAtLogon = $false

   UserPrincipalName = "uone@contoso.com"
   Name = "User One"
   GivenName = "User"
   Surname = "One"
   DisplayName = "User One"
   Description = "Test account."
   Office = "Behind the dumpster."

   Company = "Contoso"
   Department = "IT"
   Title = "Flunky"
   City = "Davie"
   State = "Florida"

    AccountPassword = "Pa11word" | ConvertTo-SecureString -AsPlainText -Force

    }

   $utwoAttributes = @{

   Enabled = $true
   ChangePasswordAtLogon = $false

   UserPrincipalName = "utwo@contoso.com"
   Name = "User Two"
   GivenName = "User"
   Surname = "Two"
   DisplayName = "User Two"
   Description = "Test account."
   Office = "Behind the dumpster."

   Company = "Contoso"
   Department = "IT"
   Title = "Flunky"
   City = "Davie"
   State = "Florida"

    AccountPassword = "Pa11word" | ConvertTo-SecureString -AsPlainText -Force

    }

    $uthreeAttributes = @{

   Enabled = $true
   ChangePasswordAtLogon = $false

   UserPrincipalName = "uthree@contoso.com"
   Name = "User Three"
   GivenName = "User"
   Surname = "Three"
   DisplayName = "User Three"
   Description = "Test account."
   Office = "Behind the dumpster."

   Company = "Contoso"
   Department = "IT"
   Title = "Flunky"
   City = "Davie"
   State = "Florida"

    AccountPassword = "Pa11word" | ConvertTo-SecureString -AsPlainText -Force

    }

   $ufourAttributes = @{

   Enabled = $true
   ChangePasswordAtLogon = $false

   UserPrincipalName = "ufour@contoso.com"
   Name = "User Four"
   GivenName = "User"
   Surname = "Four"
   DisplayName = "User Four"
   Description = "Test account."
   Office = "Behind the dumpster."

   Company = "Contoso"
   Department = "IT"
   Title = "Flunky"
   City = "Davie"
   State = "Florida"

    AccountPassword = "Pa11word" | ConvertTo-SecureString -AsPlainText -Force

    }

    New-ADUser @uoneAttributes
    New-ADUser @utwoAttributes
    New-ADUser @uthreeAttributes
    New-ADUser @ufourAttributes

    New-ADGroup -Name "Test Users" -SamAccountName "Test Users" -GroupCategory Security -GroupScope Global -DisplayName "Test Users" -Path "CN=Users,DC=contoso,DC=Com" -Description "Test group"
    
    Add-ADGroupMember -Identity "Test Users" -Members "User One","User Two","User Three","User Four"
}
