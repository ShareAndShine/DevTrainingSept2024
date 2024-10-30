import { LightningElement, api } from 'lwc';

// importing generic method that helps in creating a record
import { createRecord } from 'lightning/uiRecordApi';

// Object to whcih record to be created
import CASE_OBJ from '@salesforce/schema/Case';

// Fields to be populated in the record
import CASE_SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import CASE_DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import CASE_STATUS_FIELD from '@salesforce/schema/Case.Status';
import CASE_ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';


export default class HotelActionPlan extends LightningElement {

    // public property to receive avg. rating from parent component
    @api averageRating;


    // array of key value pairs | array of JS Object
    actionOptions = [
        { label: 'Create Action Plan Case ', value: 'APCase' },
        { label: 'Send Email To Hotel CRM', value: 'EmailCRM' },
        { label: 'Create Task To Hotel CRM', value: 'TaskCRM' }
    ];

    // holds the selected option from the drop down by the user 
    selectedOption = '';

    //propertites to hold display status of actions
    showCreateCase = false;
    showemailCRM = false;
    showtaskCRM = false;

    handleActionPlanOptionChange(event) {

        console.log('Values from event: ' + event);

        this.selectedOption = event.detail.value;
        console.log('selectedOption: ' + this.selectedOption);

        // if user has selected case create action plan option set showCreateCase to true
        if (this.selectedOption === 'APCase') {
            this.showCreateCase = true;
            this.showemailCRM = false;
            this.showtaskCRM = false;
        }
        else if (this.selectedOption === 'EmailCRM') {
            this.showemailCRM = true;
            this.showCreateCase = false;
            this.showtaskCRM = false;
        }
        else if (this.selectedOption === 'TaskCRM') {
            this.showtaskCRM = true;
            this.showemailCRM = false;
            this.showCreateCase = false;
        }
    }

    excuteAction() {
        console.log('You have selected ' + this.selectedOption);

        if(this.selectedOption === 'APCase'){
            // create case
            console.log('You have selected create case');
            
            // read case instructions from textarea element
            const caseInstructionsElement = this.template.querySelector("[data-id='txtCaseInstructions']");
            const caseInstructions = caseInstructionsElement.value;

            // read case subject from text input element
            const caseSubjectElement = this.template.querySelector("[data-id='txtCaseSubject']");
            const caseSubject = caseSubjectElement.value;


            console.log('Value of case instructions: ' + caseInstructions);
            console.log('Value of case subject: ' + caseSubject);

            // access case fields and assign values
            const fields = {}; // JS object to hold field value            
            fields[CASE_SUBJECT_FIELD.fieldApiName] = caseSubject;
            fields[CASE_DESCRIPTION_FIELD.fieldApiName] = caseInstructions;
            fields[CASE_STATUS_FIELD.fieldApiName] = 'New';
            fields[CASE_ACCOUNT_FIELD.fieldApiName] = '0015j000018Fx07AAC';

            // create record | JS promises & Arrow functions concept
            /*createRecord()
            .then()
            .error();*/
            createRecord({
                objectApiName: CASE_OBJ.objectApiName,
                fields: fields
            })
            .then(()=> {
                console.log('Record created successfully');
            })
            .catch((error) => {
                console.log('Error occured while creating record');
            });
            


            
        }


    }
}