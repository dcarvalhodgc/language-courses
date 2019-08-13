trigger RestrictContactByName on Contact (before insert, before update) {
    
    //check contacts prior to insert or update for invalid data
    // verificar contatos antes de inserir ou atualizar dados inválidos
    For (Contact c : Trigger.New) {
        if(c.LastName == 'INVALIDNAME') {   //invalidname is invalid
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }

    }

//RestrictContactByName' 
//é um gatilho que bloqueia inserções e atualizações em qualquer contato com um sobrenome de 'INVALIDNAME'.

}