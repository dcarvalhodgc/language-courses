public class AccountUtils 
{
	
	 public static List<Account> accountsByState(String state)
	 {
		 //List<Account> acctList = [SELECT Id, Name FROM Account WHERE billingState = :st];
	 	 //return acctList;
	 	return [Select id,name from account WHERE billingState =:state ];

	 }
}