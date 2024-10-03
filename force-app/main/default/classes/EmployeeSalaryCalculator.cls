public with sharing class EmployeeSalaryCalculator {
    
    // constructor
    //  special method in a class
    //  1. carries same name as your class name
    //  2. when object is created the very first method that gets 
    //  3. use to initialize class variables
    //  4. it is possible to create multiple constructor methods given that either number of arugument or 
    //     type of arguments are different
    public EmployeeSalaryCalculator() {

        System.debug('I am the constructor for  EmployeeSalaryCalculator class');       

    }

    // 3 arguments
    public EmployeeSalaryCalculator(String strEmpName, Integer iNoOfHours, Integer iHrRate) {

        // assign values to class private variables
        this.empName = strEmpName;
        this.numberOfHours = iNoOfHours;
        this.hourlyRate = iHrRate;
        
        System.debug('I am the constructor with arguments for EmployeeSalaryCalculator class');

    }

    // 2 arguments
    public EmployeeSalaryCalculator(String strempname, Integer iTotalHrsWorked)
    {
        this.empName = strempname;
        this.numberOfHours = iTotalHrsWorked;
    }

    // variables
    Integer numberOfHours;
    Integer hourlyRate;
    string empName;

    // method to calulate salary based on number employee's hourly rate and the number of hours worked in a month
    public  Integer calculateSalary(Integer numberOfHours, Integer hourlyRate) {
        return numberOfHours * hourlyRate;
    }

    // Optimized #2
    public Integer calculateEmployeeSalary()
    {
        // Version #1:
        //Integer numberOfHours = 10;
        //Integer hourlyRate = 15;
        
        //Version #2:
        System.debug('Value of this.numberOfHours is ' + this.numberOfHours);
        System.debug('Value of this.hourlyRate is ' + this.hourlyRate);

        // call calculate incentive method
        Integer randomIncentive = this.calculateIncentive();

        Integer Salary = (this.numberOfHours * this.hourlyRate) + randomIncentive;
        
        
        return Salary; 
    }
    

    // method to calculate employee incentive , for time being random number between 1000 and 500o
    public Integer calculateIncentive()
    {
        Integer incentive = Math.round((Math.random() * 1000));
        return incentive; // will return the value back to the caller
    }

    
}