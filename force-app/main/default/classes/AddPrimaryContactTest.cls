@IsTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup(){
        List<Account> accounts = new List<Account>();         
        
        for(Integer i=0; i<=50; i++){
            accounts.add(new Account(name ='Primeira Conta' + i, BillingState = 'NY'));
        }
  
        for(Integer i=0; i<=50; i++){
            accounts.add(new Account(name = 'Segunda Conta' + i, BillingState = 'CA'));
        }
        insert accounts;                   
        
    }
    
    @IsTest static void testQueueable() {
        //List<Account> accounts = [Select id, name from Account where BillingState = 'CA' or 'NY'];             
         Contact contato1 = new Contact(LastName = 'Teste');
         AddPrimaryContact updater = new AddPrimaryContact(contato1, 'CA');
        test.startTest(); 
        System.enqueueJob(updater);
        test.stopTest();
        
    }
    
}