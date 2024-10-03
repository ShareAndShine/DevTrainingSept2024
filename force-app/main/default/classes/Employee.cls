public with sharing class Employee {
    public Employee() {

    }


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