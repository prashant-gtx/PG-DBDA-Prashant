class Employee{
    String name;
    int salary;
    Employee(String name,int salary){
        this.name=name;
        this.salary=salary;
    }
}
class Manager extends Employee{
    int bonus;
    Manager(String name,int salary,int bonus){
        super(name,salary);
        this.bonus=bonus;
    }
    void totalsal(){
        System.out.println("Total Salary : "+(salary+bonus));
    }
}
public class EmployeeManagement{
    public static void main(String[] args) {
        Manager m =new Manager("Neha",30000,2500);
        m.totalsal();
    }
}