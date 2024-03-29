global class LeadProcessor implements Database.Batchable<sObject>,  Database.Stateful {	 
    
    global Integer recordsProcessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
       
        for (Lead iLead : scope) {            
            
            iLead.LeadSource  = 'Dreamforce';     
          	recordsProcessed = recordsProcessed + 1;
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){

    }      
    
}