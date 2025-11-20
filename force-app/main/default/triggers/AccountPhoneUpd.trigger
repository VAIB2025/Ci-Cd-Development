// update phone of contact if account phone update *

trigger AccountPhoneUpd on Account (after update)
{
 
 set<Id> accIds = new set<Id>();

for (Account acc : trigger.new)
{
  Account oldPhone = trigger.oldMap.get(acc.id);

if (acc.phone != oldPhone.Phone)
 {
  accIds.add(acc.id);
 }
}

List<contact> lstcontact = new List<contact>();

for (contact con : [Select id,AccountId, phone FROM Contact where AccountId IN : accIds])
 {
   string newPhone = trigger.newMap.get(con.AccountId).Phone;

  con.Phone = newPhone;

  lstcontact.add(con);
 }

if(!lstcontact.isEmpty())
{
  update lstcontact;
}
}