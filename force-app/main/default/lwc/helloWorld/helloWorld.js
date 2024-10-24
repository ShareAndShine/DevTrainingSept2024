// import - Indicates that u are referencing a code from another file
// use implements to inherit the code from another JS file 
// export - Indicates that the component being built can be imported or used inside another component 

import { LightningElement , api} from 'lwc'; // accessing lightning element JS code in helloworld

export default class HelloWorld extends LightningElement
{

    // Data binding 

    // class variable / property
    headertitle = 'Hello World Card'; //  to hold header title

    strstyle; 
    // Syntax 1 - To define a property 
    strText = 'Nilesh';

    
    // Syntax 2 - To use get method and define a property
    get participantName()
    {
        return 'Nilesh Mundle';
    }

    // property that calcuates style for the card
    get customStyle()
    {
    
        this.strstyle = 'background-color:' + this.cardColor + '; height:' + this.cardHeight + 'px; width:' + this.cardWidth + 'px;';
        return this.strstyle;
        
        
        //return `background-color:${this.cardColor}; height:${this.cardHeight}px; width:${this.cardWidth}px;`;
    }
   

    // public properties - Value for the below properties is going to come from outside of the component
    @api cardTitle;
    @api cardHeight;
    @api cardWidth;
    @api cardColor;

    // class method
    showName()
    {
        console.log('User just clicked the button !!');
        this.strText = 'Nilesh Mundle';
    }

    // Life cycle hooks 
    
    connectedCallback()
    {

        console.log('Component is connected');
    }

    renderedCallback()
    {

        console.log('Component is rendered');
    }

    disconnectedCallback()
    {

        console.log('Component is disconnected');
    }
}