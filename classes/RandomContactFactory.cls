public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContact, String lastName) {
        List<Contact> listContacts = new List<Contact>();
        //String lastName = Last;
        for(Integer i=0;i<numContact;i++) {
            Contact a = new Contact(firstName ='Contact ' + i, lastName = lastName);

            listContacts.add(a);
        }
        //insert accts;
        
        return listContacts;
        }
     
        
    }