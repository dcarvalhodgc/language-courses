public class AddPrimaryContact implements Queueable {
    
    //private List<Account> ListAccount;
    //private String cod;
    Contact ContatoTest;
    String  BillingState;

    
    Public AddPrimaryContact(Contact records, String cod){
        this.ContatoTest = records;
        this.BillingState = cod;
    }
        
    public void execute(QueueableContext context) {
        List<Account> Estado = [Select id from Account where BillingState =:BillingState Limit 200];
        List<contact> ListadeCont = new List<contact>();
        
        for(Account acct : Estado ){
        	Contact Contato1 = ContatoTest.clone();
            Contato1.AccountId = acct.id;
            ListadeCont.add(Contato1);
        }
        insert ListadeCont;
    }
}