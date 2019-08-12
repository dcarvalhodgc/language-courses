//Desafio classe recebe nome ou codigo postal e retorna uma lista de contatos filtrando por nome ou codigo postal.
public class ContactSearch {

public static List<Contact> searchForContacts (String name, string posatalCode)
	{
	List<Contact> Contacts=new List<Contact>();
	Contacts=[select id,name from contact where name=:name or mailingPostalCode=:posatalCode];

	return Contacts;

	}

}