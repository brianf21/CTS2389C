$domainQuery = Get-ADDomain -Server localhost | Select-Object -ExpandProperty DistinguishedName
$campuses = "North Campus", "South Campus", "Central Campus"
$departments = "English Department", "Math Department", "Computer Science Department", "Science Department"
$employeeTypes = "Management", "Staff", "Faculty"
$UsersOrWorkstations = "Users", "Workstations"

# Deletes all the OUs for testing
foreach ($campus in $campuses)
{
  Remove-ADOrganizationalUnit -Identity "OU=$campus,$domainQuery" -Recursive
}

foreach ($campus in $campuses)
{
  New-ADOrganizationalUnit -Name $campus -Path $domainQuery -ProtectedFromAccidentalDeletion $false
  foreach ($department in $departments)
  {
   New-ADOrganizationalUnit -Name $department -Path "OU=$campus,$domainQuery" -ProtectedFromAccidentalDeletion $false
   foreach ($employeeType in $employeeTypes)
   {
     New-ADOrganizationalUnit -Name $employeeType -Path "OU=$department,OU=$campus,$domainQuery" -ProtectedFromAccidentalDeletion $false
     foreach ($userOrWorkstation in $UsersOrWorkstations)
     {
       New-ADOrganizationalUnit -Name $userOrWorkstation -Path "OU=$employeeType,OU=$department,OU=$campus,$domainQuery" -ProtectedFromAccidentalDeletion $false
     }
    }
  }
}
