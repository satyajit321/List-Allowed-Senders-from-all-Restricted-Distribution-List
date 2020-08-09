<#
This script is to extract all users,distribution list and their members who has delivery permission to send email to a restricted distribution list.

We utilize the below attributes of the DL object, to get the accounts having access to send email to it.

AcceptMessagesOnlyFrom
AcceptMessagesOnlyFromDLMembers
AcceptMessagesOnlyFromSendersOrMembers

Please note this script doesn't do a recursive nested group member listing, its only one level.


Output style:

Restricted DL  -  Allowed MemberList(AcceptMessagesOnlyFromSendersOrMembers) - ExpandedDLMemberList

Restricted DL: RestrictedDL

Allowed DLs:
JournaledDL          

	DLUsers:
User1 
User10 
User11 

Allowed Users:
User1
Satyajit 
Administrator

#>

$AllDL = Get-DistributionGroup | where { $_.AcceptMessagesOnlyFromSendersOrMembers -ne $null}

foreach ($DLmem in $AllDL)
{
    " "
    "Restricted DL: $DLmem        "
    " "
    "Allowed DLs: "
    #$DLmem | fl *acce* #AcceptMessagesOnlyFromSendersOrMembers
      $DLmem.AcceptMessagesOnlyFromDLMembers.Name
    $DLm = $DLmem.AcceptMessagesOnlyFromDLMembers.Name

    " "
    "     DLUsers: "
    foreach ($DL in $DLm)
    {
    
    #"$DL          " 

     #(Get-DistributionGroupMember $DL).Name
     (Get-DistributionGroupMember $DL).Name
    }
    " "
    "Allowed Users:"
    $DLmem.AcceptMessagesOnlyFrom.Name

    " "
    " "
}

<# Output sample
[PS] C:\Scripts>& '.\Restricted - ListDLMembers.ps1'

Restricted DL: RestrictedDL

Allowed DLs:
JournaledDL

     DLUsers:
User1
User10
User11
User12
User100

Allowed Users:
User1
Satyajit 
Administrator



Restricted DL: RestrictedDL2

Allowed DLs:
RestrictedDL
JournaledDL

     DLUsers:
Administrator
Satyajit 
User1
User1
User10
User11
User12
User100

Allowed Users:
User10
Duke 
Harry 


[PS] C:\Scripts>

#>