 /*SCENARIO:  We are having the requirement that whenever a contact record is inserted 
 we want a welcome email to be sent to contact email address and for this,
     we are asked to write a batch apex class which will be called from the 
     trigger on “after insert “ event  on the contact record and will send emails to contact.*/
    
     trigger ContactMailSend1 on Contact (before insert) {
        Map<Id, Contact> contactMap = new Map<Id, Contact>();
           
                 for(Contact con: Trigger.new){
                     if(con.Email != null){
                        contactMap.put(con.Id, con);
                     }
                 }
        if(contactMap.size() > 0){
            Database.executeBatch(new EmailBatchClass(contactMap));
        }
    }