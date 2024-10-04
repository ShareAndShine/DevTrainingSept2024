

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

List<Integer> numbers = new List<Integer>();
numbers.add(1);
numbers.add(2);
numbers.add(3);

Account objHotelAcc1 = new Account();
objHotelAcc1.Name = 'Sea Shore Resort';
objHotelAcc1.BillingCountry = 'France';

Account objHotelAcc2 = new Account();
objHotelAcc2.Name = 'Orchid Resorts';
objHotelAcc2.BillingCountry = 'Italy';

// create a list to hold multiple accounts
List<Account> lstAccs = new List<Account>();
lstAccs.add(objHotelAcc1);
lstAccs.add(objHotelAcc2);

// call the method and pass on lst of account to insert
Hotel objHotel = new Hotel();
objHotel.createMultipleHotelAccounts(lstAccs);


