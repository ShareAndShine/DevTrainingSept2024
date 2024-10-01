// step 1: creates an instance of the class
Hotel objHotelOne = new Hotel(); 

// step 2: Use variables to provide hotel record values
objHotelOne.hotelName = 'Hotel Esthel';
objHotelOne.hotelBillingCountry = 'India';
objHotelOne.hotelCategory = '5 star';
objHotelOne.hotelLocationCity = 'Chennai';
//objHotelOne.hotelDiscount = 10; // error cos the variable was set as private

// step 3: Call method to create new hotel record
objHotelOne.createHotelRecord();




// second hotel
Hotel objHoteltwo = new Hotel();
objHoteltwo.hotelName = 'Hotel Marriot';
objHoteltwo.hotelBillingCountry = 'India';
objHoteltwo.hotelCategory = '5 star';
objHoteltwo.hotelLocationCity = 'Bangalore';
objHoteltwo.createHotelRecord();


// Third hotel
Hotel objHotelthree = new Hotel();
objHotelthree.hotelName = 'Le LOyal Meridian';
objHotelthree.hotelBillingCountry = 'India';
objHotelthree.hotelCategory = '5 star';
objHotelthree.hotelLocationCity = 'Delhi';
objHotelthree.createHotelRecord();
