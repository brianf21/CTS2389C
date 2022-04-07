$ErrorActionPreference = 'SilentlyContinue'

$domainQuery = Get-ADDomain
$campuses = "North Campus", "Central Campus", "South Campus", "Downtown Campus"
$departments = "English Department", "Math Department", "Computer Science Department", "Science Department"
$employeeTypes = "Faculty", "Staff", "Administration"

# Deletes old OU's for testing purposes
foreach ($campus in $campuses) 
{
    foreach ($department in $departments)
    {
        foreach ($employeeType in $employeeTypes) 
        {
            Set-ADOrganizationalUnit -Identity "OU=$employeeType,OU=$department,OU=$campus,$domainQuery" -ProtectedFromAccidentalDeletion $false 
            Remove-ADOrganizationalUnit "OU=$employeeType,OU=$department,OU=$campus,$domainQuery" -Confirm:$false 
        }
        Set-ADOrganizationalUnit -Identity "OU=$department,OU=$campus,$domainQuery" -ProtectedFromAccidentalDeletion $false 
        Remove-ADOrganizationalUnit "OU=$department,OU=$campus,$domainQuery" -Confirm:$false 
    }
    Set-ADOrganizationalUnit -Identity "OU=$campus,$domainQuery" -ProtectedFromAccidentalDeletion $false 
    Remove-ADOrganizationalUnit "OU=$campus,$domainQuery" -Confirm:$false 

}

# Create new OU's
foreach ($campus in $campuses) 
{
    New-ADOrganizationalUnit -Name $campus -Path $domainQuery
    foreach ($department in $departments)
    {
        New-ADOrganizationalUnit -Name $department -Path "OU=$campus,$domainQuery"
        foreach ($employeeType in $employeeTypes)
        {
            New-ADOrganizationalUnit -Name $employeeType -Path "OU=$department,OU=$campus,$domainQuery"
        }
    }
}
