/*
    Create a Trigger on the Account Object, to Prevent the Deletion of Related Contacts upon Deleting an Account Record.
 */

trigger AccountDelTrigger on Account (before delete) 
{
 if(trigger.isBefore && trigger.isDelete)
 {
     for(Account acc : trigger.old)
     {
         if(Acc.Active__c == 'Yes')
             acc.Active__c.addError ('You can not delete');
     }
 }
}