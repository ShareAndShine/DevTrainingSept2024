import { LightningElement, api, wire } from 'lwc';

//Step 2: Use @salesforce/apex module to import APEX method
import  getHotelStatsByHotelId  from '@salesforce/apex/Hotel.getHotelStatsByHotelId';

export default class HotelReviewStats extends LightningElement {

    // public property
    @api headerTitle;

    // use recordId to find the current record page CRM id
    @api recordId; // system prooperty that automatically holds the record Id of the page where this LWC component is used


    // properties to hold customer reviews count and avg. rating
    customerReviewsCount;
    avgRating;


    //propert that will calculate the color dynamically based on avg. rating 
    get ratingColor()
    {
      if(this.avgRating < 2)
      {
        return 'color:red;';
      }
      else if(this.avgRating >= 2 && this.avgRating <= 4)
      {
        return 'color:brown;';
      }
      else
      {
        return 'color:green;';
      }

    }   
    // Step 3: Make a call to APEX Method using wire adaptor
     // data and error system properties that will hold the output of APEX method
    /*@wire(<APEXMethodName>, <Send input params>)
    processOutput({data,error})

    {

    };*/
    @wire(getHotelStatsByHotelId, {hotelAccountID: '$recordId'})
    processOutput({data,error})
    {
        if(data)
        {
            console.log('data from DB::' + JSON.stringify(data));
            // read apex method output from data system property and assign to variable
            this.customerReviewsCount = data.TotalHotelReviews;
            this.avgRating = data.AvgHotelRating;
        }
        else if(error)
        {
            console.log('error::' + JSON.stringify(error));
        }
    }

    connectedCallback()
    {
        console.log('Value of record Id is ' + this.recordId);
    }

    //disconnected call back method
    disconnectedCallback()
    {
        console.log('disconnectedCallback is called');
        // check for record Id
    }


}