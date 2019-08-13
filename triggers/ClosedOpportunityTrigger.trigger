trigger ClosedOpportunityTrigger on opportunity(after insert, after update){
    List<task> carry = new List<task>();

    System.debug('triggernew: ' + trigger.new);

    for(opportunity opp: trigger.new)
    {
        if (opp.stagename.equals('Closed Won')) {
            task t=new task(whatid=opp.id,
                            Subject= 'Follow Up Test Task');
            carry.add(t);
        }
    

    
        insert carry;
    }
    System.debug('triggernew: ' + carry);
}