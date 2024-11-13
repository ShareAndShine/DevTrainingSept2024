public with sharing class Employee {
    public Employee() {
            // code runs all the time when obj is created
            // for the class
    }

/**
     * @name: Employee
     * @description: This constructor is used to initialize the values of the variables
     * @param: String empName
     * @param: Integer numberOfHours
     * @param: Integer hourlyRate
     * @return: void
     */
    public void printEmployeeSalary(String empName, Integer numberOfHours, Integer hourlyRate)
    {
        EmployeeSalaryCalculator objEmp = new EmployeeSalaryCalculator(empName, numberOfHours, hourlyRate);
        Integer Salary = objEmp.calculateEmployeeSalary();        
        System.debug('Employee Salary: ' + Salary);
    }

    public  static void SayHello() {
        
        System.debug('I m a static method');
    }

    
}