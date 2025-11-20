/*
 Create a Trigger, to make sure an Account can have max. of 4 Contact
        Records.
        
            Object Name : Contact
            Event Name  : Before Insert, Before Update
 */

trigger ContactMaxFour on Contact (before insert,before update) 
{
 if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate))
 {
     for(contact con : [Select id,lastName,Accountid FROM Contact where accountid != null ])
     {
        
     }
 }
}