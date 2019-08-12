@IsTest
public class AccountProcessorTest {
   
    @IsTest static void testContact(){
      List<Contact> ListContatos = new List<Contact>();
      List<Id> ListAccountID = new List<id>();
        
        Account acct = new Account(Name = 'teste Conta');
        insert acct;
        
        Contact Contato1 = new Contact(LastName = 'Test1', AccountId = acct.id);
        Contact Contato2 = new Contact(LastName = 'Test2', AccountId = acct.id);
        
        ListContatos.add(Contato1);
      	ListContatos.add(Contato2);
        
        insert ListContatos;
        ListAccountID.add(acct.id);
        
        test.startTest();
        AccountProcessor.countContacts(ListAccountID);
        test.stopTest();
    }    
    
}