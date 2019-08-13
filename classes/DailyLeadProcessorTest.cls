@Istest
private class DailyLeadProcessorTest {
    
        
    @IsTest static void testSchedulable() { 
        Datetime lSch5 = system.now().addMinutes(5);
        String CRON_EXP = '0 ' + String.valueOf(lSch5.minute()) + ' ' + String.valueOf(lSch5.hour()) + ' * * ?';
        
        List<Lead> ListLead = new List<Lead>();
        
        for(Integer i=0; i <10; i++){
            Lead iLead = new Lead(LastName = 'Lead' + i, Company = 'Company' + i, MobilePhone = 'MobilePhone' + i);
            ListLead.add(iLead);
        }
        insert ListLead;       
        
        DailyLeadProcessor Process = new DailyLeadProcessor();
        
        Map<id, Lead> LeadMap = new Map<id, Lead>(ListLead);
        List<id> LeadsID = new List<Id>(LeadMap.keySet());
        
        Test.startTest();
        String jobId = System.Schedule('AgendamentoDeTest', CRON_EXP, Process);
        //List<Lead> iL = [SELECT Id, LeadSource FROM Lead WHERE id IN :LeadsID];
        String  Dreamforce = 'Dreamforce';        
              
        
        Test.stopTest();
        
         for(Lead a : ListLead){
        	a.LeadSource  = 'Dreamforce';            
            system.assertEquals(a.LeadSource, Dreamforce, 'Erro');
        }
        
    }
}