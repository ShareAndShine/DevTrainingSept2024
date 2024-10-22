// import - Indicates that u are referencing a code from another file
// use implements to inherit the code from another JS file 
// export - Indicates that the component being built can be imported or used inside another component 

import { LightningElement } from 'lwc'; // accessing lightning element JS code in helloworld

export default class HelloWorld extends LightningElement
{

    // Data binding 

    // class variable / property
    headertitle = 'Hello World Card'; //  to hold header title


    // class method
    showName()
    {
        console.log('User just clicked the button !!');
    }
}