/*
    Create a Trigger on the Account Object, to Prevent the Deletion of Related Contacts upon Deleting an Account Record.
 */

trigger AccountConDelTrigger on Account (before delete) 
{
  if(trigger.isBefore && trigger.isDelete)
  {
      for(Account acc : trigger.old)
          {
              if(acc.contacts != null)
              {
                  acc.addError ('Can not delete account because few contacts are associated');
              }
          }
  }
   
}