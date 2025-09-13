class Employee{
    double salary;
    double numOfHrWorks;
    void getInfo(double salary, double numOfHrWorks){
        this.salary=salary;
        this.numOfHrWorks=numOfHrWorks;
        System.out.println("Salary : "+salary);
        System.out.println("Number of hours works in day : "+numOfHrWorks);
    }
    double AddSal(){
        if (salary < 500){
            salary += 10;
        }   
        return salary;
    }
    double AddWork(){
        if (numOfHrWorks>6){
            salary+=5;
        }
        return salary;
    }
}

public class EmployeeSalary{
    public static void main(String[] args) {
        Employee e =new Employee();
        e.getInfo(6258, 9);
        double sal=e.AddSal();
        double sal2= e.AddWork();

        e.getInfo(sal2, 9);
    }
}