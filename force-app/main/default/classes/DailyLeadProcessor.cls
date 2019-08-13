global class DailyLeadProcessor implements Schedulable{

    global void execute(SchedulableContext ctx){
        List<Lead> listLead = [Select id, Name from lead where LeadSource = '' limit 200];
        
        for(Lead iLead : listLead){
            iLead.LeadSource  = 'Dreamforce';
        }
        update listLead;
    }
}