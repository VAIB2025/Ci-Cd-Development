public class ApexSceanrio 
{
/* 5. Query This/Last Week created Accounts with related contacts.
          [Hint: Parent-Child SOQL]
*/
  Public static void fetchAccountToCont()
  {
      List<Account> lstAccount = [Select id,Name,Phone,(Select id,lastName,Phone FROM Contacts) FROM Account Where CreatedDate = THIS_WEEk];
      {
          System.debug('Last Week Create size..:'+lstAccount.size());
      }
  }
    
    /*
     6. Query This/Last Week created contacts with related account Name and Phone.
     [Hint: Child-Parent SOQL]

     */
    
    public static void conToAcc()
    {
        List<contact> lstcontact = [Select id,lastName,Phone,Fax,Account.Name,Account.Phone FROM Contact where CreatedDate = Last_N_Days:30];
        
        System.debug ('This 30 Days CreatedDate..:'+lstcontact.size());
    }
    
    /*
      7. Query Account (Id, Name, Phone) with Related Opportunities (Name, CloseDate, Stage)
         where Account Phone != null. Sort the records in both Asc or Desc Order based on
          CreatedDate.
     */
    
    public static void oppTOaccount()
    {
        List<Account> lstAccount = [Select id,Name,Phone,(Select id,Name FROM Opportunities) FROM Account where Phone !=null Order by CreatedDate DESC ];
        
        System.debug('Account with opp..:'+lstAccount.size());
    }
    
    /*
     * 8. Query Account along with related contacts where Account phone!=null. Now display
           results through system.debug( ) in following ways:
               Account Name has #ofcontacts related.
     */
    Public static void AccountToCont()
  {
      List<Account> lstAccount = [Select id,Name,Phone,(Select id,lastName,Phone FROM Contacts) FROM Account Where Phone != null];
      {
        for (Account Acc : lstAccount)
        {
            integer noCon = Acc.contacts.size();
            
            System.debug (acc.Name +'has'+ noCon +  'related contacts.');
            /*
            System.debug('Account Name..:'+Acc.Name);
            System.debug('Account Phone..:'+Acc.Phone);
            System.debug('Account Name..:'+Acc.id);
           
            for(Contact con : acc.contacts)
            {
                System.debug('Contact Name..:'+con.lastName);
                System.debug('Contact Phone..:'+con.Phone);
               
                
            }
  */
        }
      }
  }
     /*
      9. Query Account along with related opportunities where Account phone!=null. Now display
     results through system.debug( ) in following ways:
     */
    
    public static void acctOoPP1()
    {
        List<Account> lstAccount = [Select id,Name,Phone,(Select id,Name,amount FROM Opportunities) FROM Account Where Phone != null];
        {
            for (Account Acc : lstAccount)
                
        
            {
               integer oppNumber = acc.opportunities.size();
              
                System.debug ( acc.Name +'  '+ oppNumber+'  worth Opportunities' );
            }
        }
    }
    
    /*
     10. Create 2 Account records with two separate insert statements. Then create 2 Account
records with a single insert DML statement using List.
     */
    
    public static void acc2inserDML()
    {
        Account acc = new Account(name='vaibhav', phone='9988776655', rating='hot' );
        Account acc2 = new Account(name='kadam', phone='9984476655', rating='hot' );
        
        insert acc;
        insert acc2;
        
        
    }
     public static void lstAccinsert()
     {
         List<Account> lstacc = new List<Account>();
         
        
             account acc1 = new account();
             acc1.Name = 'Test1';
           
             lstacc.add(acc1);
             
             account acc2 = new account();
             acc2.Name = 'Test2';
      
             
             lstacc.add(acc2);
        
        
             insert lstacc;
         
         system.debug('Record inserted..:'+lstacc.size());
         
     }
    
    /*
     11. Insert 5 Accounts by populating Name, Phone, Type, Annual Revenue and Industry Field
         Values. [Hint: Use Loop]
     */
    
    public static void bulkaccInsert()
    {
        List<account> lstacc = new List<account>();
        
        for(integer counter = 0 ; counter <=5 ; counter++)
        {
            Account acc = new account();
            
            acc.Name = 'Test'+counter;
            acc.Phone = '786764844';
            acc.AnnualRevenue = 1000000;
            acc.type = 'Prospect';
            acc.Industry = 'Industry';
            
            lstacc.add(acc);
        }
        if(!lstacc.isEmpty())
        {
            insert lstacc;
            system.debug('Record inserted..:'+lstacc.size());
         
        }
    }
/*    
    12. Insert 5 Opportunities with different Opportunity Names, CloseDate = Today’s Date and
Stage = ‘Prospecting’. [Hint: Use Loop]
*/
    public static void oppinsertionbulk1()
    {
        List<Opportunity> lstopp = new List<Opportunity>();
        
        for(integer counter = 1 ; counter <=5 ; counter++)
        {
            Opportunity opp = new Opportunity();
            
            opp.Name = 'Practice'+counter;
            opp.CloseDate = system.today();
            opp.StageName = 'Prospecting';
             lstopp.add(opp);
        }
        if(!lstopp.isEmpty())
        {
            insert lstopp;
            system.debug('Record inserted..:'+lstopp.size());
        }
    }
    
    /*
     13. Insert an Account along with 1 related Contact.
     */
    
    public static void accInsertwithCon()
    {
        Account acc = new account();
        
        acc.Name = 'accInCon1';
        acc.Phone = '554587588';
        acc.Rating = 'Hot';
        acc.Description = 'Hot account';
          
         insert acc; 
        
         system.debug('Account Inserted..:'+acc);
        
        {
            contact con = new contact ();
            
            con.lastName = 'conToAcc';
            con.Phone = '7485265454';
            con.AccountId = acc.id;
            
            insert con;
            system.debug('Contact Inserted..:'+con);
            
        }
    }
    
    /*
     16. Insert 5 Accounts and a Contact & a Opportunity related to each account.
      [Hint: Use Loop and List]
     */
    
    public static void accFiveInsert()
    {
        List<Account> lstAccount = new List<Account>();
        
        for (Integer counter =1 ; counter <=5 ; counter++)
        {
            Account acc = new Account();
            
            acc.Name = 'TESTA'+counter;
            acc.Phone ='66378978989';
            acc.Rating = 'Prospect';
            acc.Description = 'Hot account rec';
            acc.Active__c = 'Yes';
            
            lstAccount.add(acc);
            
        }
        if(!lstAccount.isEmpty())
        {
            insert lstAccount;
             System.debug('Contact Inserted...:'+lstAccount.size());
            
            for(Account acc : lstAccount)
            {
                contact con = new contact();
                
                con.LastName = 'TESTA Contact';
                con.Phone = '736363933';
                con.AccountId = acc.Id;
                
                insert con;
                
                System.debug('Contact Inserted...:'+con);
            }
        }
    }
    
    /*
     17. Query Accounts where Phone =’123456’ and update Phone to ’654321’.
     */
    
    public static void PhoneUpdation()
    {
        List<Account> lstAccount = [Select id,Phone FROM Account where Phone = '56789'];
        
        
        for(Account Acc : lstAccount)
        {
            acc.phone = '123456';
           
        }
        if(!lstAccount.isEmpty())
        {
            update lstAccount;
            
            system.debug (' updated account....:'+ lstAccount.size());
        }
    }
    
    /*
      18. Query Contacts where Email is null and update their email with
          ‘welcome@studysalesforce.com.
     */
    
    public static void conEmailUpd()
    {
        List<Contact> lstContact = [Select id,lastName,Phone,Email FROM contact where Email != null];
        
        for(contact con : lstContact)
        {
            con.Email = 'welcome@studysalesforce.com';
        }
        if(!lstcontact.isEmpty())
        {
            update lstcontact;
            
            System.debug('Updated contact Size..:'+lstContact.size());
        }
    }
    
    /*
     19. Query Accounts where Phone =654321 and update Phone to 123456. Also create 5 new
        account records. [Hint : Use Upsert Statement]
     */
    
    Public static void accUpsert()
    {
        List<Account> lstAccount = [select id,Name,phone FROM Account where Phone = '123456'];
        
        for(Account Acc : lstAccount)
        {
            acc.Phone = '67891';
         
        }
        for (integer counter =1 ; counter<=5 ; counter++)
        {
            Account acc1 = new account();
            
            acc1.Name = 'TESTB'+counter;
            acc1.phone = '8977897899';
            acc1.Description = 'HOT Accounts';
            lstAccount.add(acc1);  
        }
        
        if(!lstAccount.isEmpty())
        {
            Upsert lstAccount;
            
            System.debug ('Upserted Accounts size...:'+ lstAccount.size());
        }
    }
    
    /*
     20. Query Opportunities where created date is last month and updated their stage to closed
      won. Also create 5 new opportunities. [Hint: Use Upsert Statement]
     */
    
    public static void upsertOpp1()
    {
        List<opportunity> lstopp = [Select id,Name,stageName,amount FROM Opportunity Where CreatedDate = Last_Month];
        
        for(opportunity opp : lstopp)
        {
            opp.StageName = 'Closed won';
        }
        for(integer counter =1 ; counter <=5; counter++)
        {
            opportunity opp1 = new opportunity();
            
            opp1.Name = 'OppTest'+counter;
            opp1.Amount = 10000;
            opp1.stageName = 'closed Won';
            opp1.closeDate = System.today().addDays(-20);
            lstopp.add(opp1);
        }
        if(!lstopp.isEmpty())
        {
            upsert lstopp;
            
            System.debug('Upserted Record size...:'+lstopp.size());
        }
    }
    
    /*
     21. Delete account records where Phone =’123456’. Verify whether records are deleted
         through Recycle Bin.
     */
    
    public static void delAcc()
    {
        List<Account> lstacc = [Select id ,name,Phone FROM Account where Phone = '67891'];
        
        if(!lstacc.isEmpty())
        {
            delete lstacc;
        }
    }
    
    /*
     23. Insert 200 Account records and your code should not hit the governor limit. Once records
     are successfully created then just delete those 200 records only
     
     */
    public static void accUopin()
    {
      List<Account> lstAccount = new List<Account>();
        
        for(Integer counter =1 ; counter<= 200 ; counter++)
            
        {
          Account acc = new account();
                acc.Name = 'TEST N'+counter;
                acc.Rating = 'Hot';
                acc.Phone = '7876787878';
                acc.Description = '200 record inserted';
                
                lstAccount.add(acc);
            
       
        }
        
          if(!lstAccount.isEmpty())
        {
            insert lstAccount;
            
            System.debug('200 Record Inserted...:'+lstAccount.size());
        }
        
       
    }
    
    public static void delaccountN()
    {
        List<Account> lstAccount = [Select id,Name,Phone FROM account where CreatedDate = THIS_WEEK];
        
        if(!lstACcount.isEmpty())
        {
            Delete lstAccount;
            
            System.debug('Deleted Account Size...:'+lstACcount.size());
        }
    }
    
     /*
     23. Insert 200 Opportunnity records and your code should not hit the governor limit. Once records
     are successfully created then just delete those 200 records only
     
     */
    public static void accUopin2()
    {
      List<Opportunity> lstAccount = new List<Opportunity>();
        
        for(Integer counter =1 ; counter<= 200 ; counter++)
            
        {
          Opportunity acc = new Opportunity();
                acc.Name = 'TEST N'+counter;
                acc.stageName = 'Prospecting';
                acc.closeDate = system.today();
                
                
                acc.Description = '200 record inserted';
                
                lstAccount.add(acc);
            
       
        }
        
          if(!lstAccount.isEmpty())
        {
            insert lstAccount;
            
            System.debug('200 Opportunity Record Inserted...:'+lstAccount.size());
        }
        
       
    }
    
    /*
     * 26. Query Account created in the last 7 days. Now update their phone number with
‘1234567890’.
     */
    
    public static void phoneUpdation1()
    {
        List<Account> lstAccount = [Select id,Name,Phone FROM Account where CreatedDate = LAST_N_DAYS :7];
        
        for(Account acc : lstAccount)
        {
            acc.Phone = '123456789';
        }
        if(!lstAccount.isEmpty())
        {
            Update lstAccount;
            
            System.debug('Account updated Size...:'+ lstAccount.size());
        }
    }
    
    /*
     27. Query Opportunities created in the last 7 days. If the opportunity stage is closed won 
      then update description as ‘Opportunity is Closed Won’, in case of closed lost update
       description as ‘Opportunity is Closed Lost’, otherwise ‘Opportunity is Open
     */
    
    public static void uppUpd()
    {
        List<opportunity> lstopp = [Select id,Name,stageName,Description FROM Opportunity];
       
            for(opportunity opp : lstopp)
            {
                if(opp.stageName == 'Closed Won')
                {
                    opp.Description = 'Opportunity is Closed Won';
                }
                else if(opp.StageName == 'closed lost')
                {
                    opp.Description = 'Opportunity is Closed Lost';
                }
            }
            if(!lstopp.isEmpty())
            {
                update lstopp;
                
                System.debug('Updated opp....:'+ lstopp.size());
            }        
    }
    
    /*
     28. Query Accounts created in the last one month. Populated ’Total Contacts’ Field on
        Account by counting number of contacts associated with Account. If no contact then
        populate 0.
     */
    
    public static void countAcc()
    {
       List<Account> lstAccount = [Select id,Name,Phone,Total_Contacts__C,(Select id,Name,phone FROM Contacts) FROM Account /* WHere CreatedDate = Last_Month */ ];
        
        for(Account acc : lstAccount)
        {
            acc.Total_Contacts__C = acc.contacts.size();
        }
        
        if(!lstAccount.isEmpty())
        {
            update lstAccount;
            System.debug('Updated Account Size...:'+ lstAccount.size());
        }              
    }
    
    /*
     29. Query Contacts created last week and if Mobile phone is not populated on contact then
     copy Phone of Related Account. [Hint: Use Child-Parent SOQL]
     */
    
    public static void copyAccPhone()
    {
        List<Contact > lstcon = [Select id,lastName,phone,Fax, Account.Phone FROM Contact];
        {
            for(contact con : lstcon)
            {
                con.phone = con.account.phone;
            }
        }
        if (!lstCon.isEmpty())
        {
            update lstcon;
            
            system.debug ('Updated Contact...:'+ lstcon.size());
        }
    }
}