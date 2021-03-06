<div><strong>Description:</strong></div>
<div>This script will find all Distribution List in the environment with Delivery Restriction Enabled and</div>
<div>then&nbsp;for each of those DLs&nbsp;extract all users,distribution&nbsp;list and their&nbsp;members who has delivery permission to send email to&nbsp;the restricted distribution list.</div>
<div>We utilize the below attributes of the DL object, to get the accounts having access to send email to it.</div>
<div>AcceptMessagesOnlyFrom<br /> AcceptMessagesOnlyFromDLMembers<br /> AcceptMessagesOnlyFromSendersOrMembers</div>
<div>Please note this script doesn't do a recursive nested group member listing, its only one level. And there is lots of scope for formatting it as per requirement. But as a basic script this should be enough.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>Usage:</strong></div>
<div>
<div>You can directly run this script in Exchange Management Shell, without any parameters.</div>
<div>If you would like to filter the listed DLs&nbsp;change the below line in the top of the script to&nbsp;modify as per your requirement.</div>
<div>$AllDL = Get-DistributionGroup | where { $_.AcceptMessagesOnlyFromSendersOrMembers -ne $null}</div>
<div>
<div>$AllDL = Get-DistributionGroup | where { {$_.AcceptMessagesOnlyFromSendersOrMembers -ne $null} -and {$_.Name -like "ResearchDL*"}}</div>
<div>&nbsp;</div>
<div><strong>Results:</strong></div>
</div>
<div>The result is directly to the console, that you can point to a text file like this</div>
<div>'Restricted - ListDLMembers.ps1'&gt; Output.txt</div>
<div><strong>&nbsp;</strong></div>
<div>What does these&nbsp;mean.</div>
<div>DL found in the above Get-DistributionGroup&nbsp;will be looped which would result in below sections for each of them.</div>
<p>Restricted DL: The delivery restricted DL for which we are finding the allowed senders</p>
<p>Allowed DLs: The direct DLs from allowed senders list<br /> &nbsp;&nbsp;&nbsp;&nbsp; DLUsers: The members of the Allowed DLs (Basically expantion of the above DL list)</p>
<p>Allowed Users: The direct Users from the allowed senders list<br /> <strong></strong>&nbsp;</p>
<div><strong>Sample Script Run and Output:</strong></div>
</div>
<div>Restricted - ListDLMembers.ps1</div>
<div>&nbsp;</div>
<div>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">[PS] C:\Scripts&gt;&amp; '.\Restricted - ListDLMembers.ps1'

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


[PS] C:\Scripts&gt;</pre>
<div class="preview">
<pre class="js">[PS]&nbsp;C:\Scripts&gt;&amp;&nbsp;<span class="js__string">'.\Restricted&nbsp;-&nbsp;ListDLMembers.ps1'</span>&nbsp;
&nbsp;
Restricted&nbsp;DL:&nbsp;RestrictedDL&nbsp;
&nbsp;
Allowed&nbsp;DLs:&nbsp;
JournaledDL&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DLUsers:&nbsp;
User1&nbsp;
User10&nbsp;
User11&nbsp;
User12&nbsp;
User100&nbsp;
&nbsp;
Allowed&nbsp;Users:&nbsp;
User1&nbsp;
Satyajit&nbsp;&nbsp;
Administrator&nbsp;
&nbsp;
&nbsp;
&nbsp;
Restricted&nbsp;DL:&nbsp;RestrictedDL2&nbsp;
&nbsp;
Allowed&nbsp;DLs:&nbsp;
RestrictedDL&nbsp;
JournaledDL&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DLUsers:&nbsp;
Administrator&nbsp;
Satyajit&nbsp;&nbsp;
User1&nbsp;
User1&nbsp;
User10&nbsp;
User11&nbsp;
User12&nbsp;
User100&nbsp;
&nbsp;
Allowed&nbsp;Users:&nbsp;
User10&nbsp;
Duke&nbsp;&nbsp;
Harry&nbsp;&nbsp;
&nbsp;
&nbsp;
[PS]&nbsp;C:\Scripts&gt;</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
</div>
