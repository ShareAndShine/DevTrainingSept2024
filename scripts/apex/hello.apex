

/*EmployeeSalaryCalculator objemp1 = new EmployeeSalaryCalculator();
objemp1.empName = 'Mahesh';
objemp1.numberOfHours = 240;
objemp1.hourlyRate = 15;
objemp1.calculateEmployeeSalary();

EmployeeSalaryCalculator objemp2 = new EmployeeSalaryCalculator();
objemp2.empName = 'Lav Batra';
objemp2.numberOfHours = 150;
objemp2.hourlyRate = 20;
objemp2.calculateEmployeeSalary();*/

/*EmployeeSalaryCalculator objemp1 = new EmployeeSalaryCalculator('Mahesh',240,15);
Integer emp1Salary = objemp1.calculateEmployeeSalary(); // call the method and read the output value
System.debug('Salary is ' + emp1Salary); 



EmployeeSalaryCalculator objemp2 = new EmployeeSalaryCalculator('Lav Batra',150,20);
Integer emp2Salarry = objemp2.calculateEmployeeSalary(); // call the method and read the output value
System.debug('Salary is ' + emp2Salarry);
*/

/*Employee objEmp = new Employee();
objEmp.printEmployeeSalary('Mani', 240, 25);

//call static method directly using class name 
Employee.SayHello();
*/

/*
Hotel objHotel = new Hotel('Hotel Polimer', 'Chennai', 'Koil Street', 
'India', 'www.hotelpolimer.com','44403330222');
Id inewId = objHotel.createHotel(); // call the method and read the newly created hotel account id
System.debug('Newly created hotel Id is ' + inewId);


Hotel objHotel1 = new Hotel('Hotel DasaPrakash', 'India');
Id inewId1 = objHotel1.createHotel(); // call the method and read the newly created hotel account id
System.debug('Newly created hotel Id is ' + inewId1);


Hotel objHotel2 = new Hotel('', 'India');
Id inewId2 = objHotel2.createHotel(); // call the method and read the newly created hotel account id
System.debug('Newly created hotel Id is ' + inewId2);
*/

/*Hotel objHotel = new Hotel();
objHotel.updateWebsite('www.grandhotel.com', '0015j000018Fx02AAC');
objHotel.updateHotelRating(4, 'a005j00000P0SLTAA3');
*/

/*List<Integer> numbers = new List<Integer>();
numbers.add(1);
numbers.add(2);
numbers.add(3);

// Loop thru the integer collection
for(Integer inum : numbers)
{
    System.debug('Value is ::' + inum);
}


Account objHotelAcc1 = new Account();
objHotelAcc1.Name = 'Peters Park Resort';
objHotelAcc1.BillingCountry = 'Itlay';

Account objHotelAcc2 = new Account();
objHotelAcc2.Name = '';
objHotelAcc2.BillingCountry = 'India';

Account objHotelAcc3 = new Account();
objHotelAcc1.Name = 'Lake View Spa & Resort';
objHotelAcc1.BillingCountry = 'SriLanka';

// create a list to hold multiple accounts
List<Account> lstAccs = new List<Account>();
lstAccs.add(objHotelAcc1);
lstAccs.add(objHotelAcc2);
lstAccs.add(objHotelAcc3);

// call the method and pass on lst of account to insert
Hotel objHotel = new Hotel();
//objHotel.createMultipleHotelAccounts(lstAccs);
objHotel.createMultipleHotelAccounts_WithPartialInsertEnabled(lstAccs);

*/

// Map collection 

//Syntax
//Map<key, value> objMap = new Map<key,value>();

// Use map to store week day number and text
/*Map<Integer, String> objWeekMap = new Map<Integer, String>();
objWeekMap.put(1,'Sunday');
objWeekMap.put(2,'Monday');
objWeekMap.put(3,'Tuesday');
objWeekMap.put(4,'Wednesday');
objWeekMap.put(5,'Thursday');
objWeekMap.put(6,'Friday');
objWeekMap.put(7,'Saturday');
System.debug('objWeekMap::' + objWeekMap);

// get thrusday 
System.debug(objWeekMap.get(5));
System.debug(objWeekMap.get(6));

// Create a map that hold hotel data and given hotel account Number , I would like to get entire hotel data

Account objHotelAcc1 = new Account();
objHotelAcc1.AccountNumber = '0x111';
objHotelAcc1.Name = 'Four seasons Hotel';
objHotelAcc1.BillingCountry = 'India';

Account objHotelAcc2 = new Account();
objHotelAcc2.AccountNumber = '0x222';
objHotelAcc2.Name = 'Bing Bang Hotel';
objHotelAcc2.BillingCountry = 'India';

Account objHotelAcc3 = new Account();
objHotelAcc3.AccountNumber = '0x333';
objHotelAcc3.Name = 'Galmoorous GateWays';
objHotelAcc3.BillingCountry = 'India';


Map<String, Account> objHotelMap = new Map<String, Account>();
objHotelMap.put('0x111',  objHotelAcc1);
objHotelMap.put('0x222',  objHotelAcc2);
objHotelMap.put('0x333',  objHotelAcc3);

System.debug('3rd hotel is ' +   objHotelMap.get('0x333')); // bring outdata from collection 
*/
// Create a map to hold avg. hotel rating and hotel reviews count
/*Map<String, Decimal> objHotelStats = new Map<String, Decimal>();

objHotelStats.put('AvgHotelRating', 4.2);
objHotelStats.put('TotalHotelReviews', 10);

System.debug('Hotel Stats ::' + objHotelStats);
System.debug('Total Hotel Reviews ::' + objHotelStats.get('TotalHotelReviews'));
*/



/*
Hotel obj = new Hotel();

Map<String, Decimal> output = obj.getHotelStats();
Decimal dAvgRating = output.get('AvgHotelRating');
Decimal dTotalHotelReviews = output.get('TotalHotelReviews');

System.debug('Avg. Rating is ' + dAvgRating);
System.debug('Total Hotel Reviews is ' + dTotalHotelReviews);



obj.getHotelStatsByHotelId('0015j000018Fx07AAC');
obj.getHotelStatsByHotelId('0015j000018Fx09AAC');


Integer iSmallNumer = 1; // works fine
Integer iLargeNumer = objHotelAcc1; // data mismatch . object cannot be assigned to an integer
Integer iAnotherNumber = 4.533; // assigning decimal to an integer

// forcefully convert the data type
Integer iNumber = (Integer)4.533; // conversion happens

*/
/*

Hotel obj = new Hotel();
obj.getHotelStatsByHotelId('0015j000018Fx07AAC');
obj.getHotelStatsByHotelId('0015j000018Fx09AAC');

Integer iNumber = Integer.valueOf('1');
System.debug('iNumber::' + iNumber);


Integer iNumberOne = Integer.valueOf('One'); // totally wrong

*/

//HotelReviewNotifier.notifyRelationshipOfficer('0015j00001BHOjnAAH');

// BAD CODE - Breaches Governor limit
/*
for(Integer i=1; i<=200 ; i++)
{
    Account acc = new Account();
    acc.Name = 'Test ' + i;
    insert acc; // DML statement runs for 200 times
}*/


// Execute the batch with a batch size of 5
HotelReviewBatch batchHR = new HotelReviewBatch();
Database.executeBatch(batchHR, 5);