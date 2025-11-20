//Create a Trigger on the Lead Object, to make sure Lead Phone, Fax and Email Fields should be required while creating New Lead Record.
trigger LeadTrigger on Lead (before insert) 
{
 if(trigger.isInsert && trigger.isBefore)
     {
         for(Lead ldRecord : trigger.New)
         {
             if(ldRecord.Phone == null || ldRecord.Phone == '')
             {
                 ldRecord.Phone.addError('Please Insert the Phone Number');
             }
             else if( ldRecord.Email == null || ldRecord.Email == '')
             {
                 ldRecord.Email.addError('Please Insert the Email Field');
             }
             else if (ldRecord.Fax == null || ldRecord.Fax == '')
             {
                 ldRecord.Fax.addError('Please insert Fax Fields');
             }
         }
     }
}