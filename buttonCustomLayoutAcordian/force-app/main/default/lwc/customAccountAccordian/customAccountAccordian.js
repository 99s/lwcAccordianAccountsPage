import { LightningElement } from 'lwc';
import totalAccountCount from '@salesforce/apex/AccordianAccountClass.totalAccountCount';
import getContactsAndAccs from '@salesforce/apex/AccordianAccountClass.getContactsAndAccs';

export default class CustomAccountAccordian extends LightningElement {

    blocksize_api = 10;
    index_api = 0;
    total_api = 0;
    accountData_api;
    error_api = '';

    connectedCallback(){
        console.log('1. CustomAccountAccordian connectedCallback');
        if(total_api == 0){
            this.getRecordNumber();
        }
        
         this.getContactsAndAccsCaller();
     }
 
     renderedCallback(){
         console.log('2. CustomAccountAccordian renderedCallback');
     }
 
     getContactsAndAccsCaller(){
         
         try{
            getContactsAndAccs({blockSize: this.blocksize_api, index: this.index_api}).then(result=>{
                 this.accountData_api = result;
                 console.log(result);
                 this.index_api =+ this.blocksize_api;
             }).catch(error=>{
                 this.error_api = error;
                 console.log('-----error-----');
                 console.log(error);
             })
             console.log('~-getContactsAndAccsCaller-~');
         }  
         catch(e){
             console.log('getContactsAndAccsCaller-----error-----getContactsAndAccsCaller');
             console.log(e);
         }
     }

     getRecordNumber(){
         
        try{
            totalAccountCount({}).then(result=>{
                this.total_api = result;
                console.log(result);
            }).catch(error=>{
                this.error_api = error;
                console.log('-----getRecordNumbererror-----');
                console.log(error);
            })
            console.log('~-getRecordNumberCaller-~');
        }  
        catch(e){
            console.log('getRecordNumber-----error-----getRecordNumber');
            console.log(e);
        }
    }



}