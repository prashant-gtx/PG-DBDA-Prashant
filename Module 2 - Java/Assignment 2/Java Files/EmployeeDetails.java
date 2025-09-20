abstract class Employee{
    abstract void calculateSalary();
} 
class FullTimeEmployee extends Employee{
    void calculateSalary(){
        System.out.println("I am FullTimeEmployee");
    }
}
class PartTimeEmployeeclasses extends Employee{
    void calculateSalary(){
        System.out.println("I am PartTimeEmployeeclasses");
    }
}
public class EmployeeDetails{
    public static void main(String[] args) {
        FullTimeEmployee f =new FullTimeEmployee();
        PartTimeEmployeeclasses ptj =new PartTimeEmployeeclasses();
        f.calculateSalary();
        ptj.calculateSalary();
    }
}