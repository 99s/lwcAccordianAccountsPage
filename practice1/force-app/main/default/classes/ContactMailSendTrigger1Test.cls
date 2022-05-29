@isTest
public with sharing class ContactMailSendTrigger1Test {
    @isTest static void TestContactMailSendTrigger1(){
        Contact con = new Contact(
            Name = 'testContact',
            Email = 'divi9e@gmail.com'
        );

        //insert con;
        Test.startTest();
        insert con;

    
        Integer emailInvocations = Limits.getEmailInvocations();
   

    system.assertEquals(1, emailInvocations, 'emails should be sent');
     
    }
}