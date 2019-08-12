public class TesteController {
    private Contact contato {get; set;}
    
    public TesteController(ApexPages.StandardController stdController){
        contato = (Contact)stdController.getRecord();
    }
    
    public void Salvar(){
        insert contato;
        //System.debug('salvar');
    }
}