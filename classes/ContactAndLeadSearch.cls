public class ContactAndLeadSearch

{

        public static List<List<sObject>> searchContactsAndLeads(String smith)

        {

            String searchQuery = 'FIND \'' + smith + '\' IN ALL FIELDS RETURNING Lead(Name,FirstName,LastName ), Contact(FirstName,LastName )';

            List<List<sObject>> searchConLead = search.query(searchQuery);

            return searchConLead;

        }

}