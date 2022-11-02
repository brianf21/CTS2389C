$uoneAttributes = @{
  Enabled = $true
  ChangePasswordAtLogon = $false

  UserPrincipalName = "uone@contoso.com"
  Name = "uone"
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
  Name = "utwo"
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
  Name = "uthree"
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
  Name = "ufour"
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
