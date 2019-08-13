public with sharing class ExpensesController {
    @AuraEnabled
    public static List<Expense__c> getExpenses() {
        // Perform isAccessible() checking first, then
        return [SELECT Id, Name, Amount__c, Client__c, Date__c, 
                       Reimbursed__c, CreatedDate 
                FROM Expense__c];
    }
    
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense) {
        // Perform isUpdatable() checking first, then
        upsert expense;
        return expense;
    }
    
    @AuraEnabled
    public static Expense__c updateReimbursed(id idExpense, boolean reimbursed ) {
        Expense__c varExpense = [SELECT Id,
                                 Reimbursed__c  
                                 FROM Expense__c where id = :idExpense];
        system.debug('reimbursed>>>' + reimbursed);
          system.debug('varExpense>>>' + varExpense);
        if(reimbursed == true){
            varExpense.Reimbursed__c = true;
        }else{
            varExpense.Reimbursed__c = false;
        }
        
        update varExpense;
        return varExpense;
    }
}