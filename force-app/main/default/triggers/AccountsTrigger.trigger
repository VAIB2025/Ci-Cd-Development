/*
 * Create a Trigger on Account Object, to Auto Populate the Annual Revenue based on the Account Industry as below.
            Industry Name           Annual Revenue
            ---------------------------------------
             Banking                 4,57,00,000
             Finance                 6,89,00,000
             Insurance               9,00,00,000
             Manufacturing           3,50,00,000
             Technology              5,45,00,000
             Energy                  7,40,00,000
 */

trigger AccountsTrigger on Account (before insert) 
{
 if(trigger.isBefore && trigger.isInsert)
 {
     for(Account Acc : trigger.new)
     {
         if(Acc.Industry == 'Banking' )
         {
             acc.annualrevenue =  45700000 ; 
         }
         else if (Acc.Industry == 'Finance')
         {
             acc.AnnualRevenue = 68900000;
         }
         else if (Acc.Industry == 'Insurance')
         {
             acc.AnnualRevenue = 90000000;
         }
         else if (Acc.Industry == 'Manufacturing')
         {
             acc.AnnualRevenue = 35000000;
         }
         else if (acc.Industry == 'Technology')
         {
             acc.AnnualRevenue = 54500000;
         }
         else if (acc.Industry == 'Energy' ) 
         {
             acc.AnnualRevenue = 74000000;
         }
     }
 }
}