class Employee {
    String name;
    int yearOfJoining;
    double salary;
    String address;
    Employee(String name, int yearOfJoining, double salary, String address) {
        this.name = name;
        this.yearOfJoining = yearOfJoining;
        this.salary = salary;
        this.address = address;
    }
}

public class EmployeeInfo {
    public static void main(String[] args) {
        Employee e1 = new Employee("Robert", 1994, 20000, "64C- WallsStreat");
        Employee e2 = new Employee("Sam", 2000, 30000, "68D- WallsStreat");
        Employee e3 = new Employee("John", 1999, 25000, "26B- WallsStreat");
        System.out.println("Name\tYear of joining\tSalary\tAddress");
        System.out.println(e1.name + "\t" + e1.yearOfJoining + "\t\t" + e1.salary + "\t" + e1.address);
        System.out.println(e2.name + "\t" + e2.yearOfJoining + "\t\t" + e2.salary + "\t" + e2.address);
        System.out.println(e3.name + "\t" + e3.yearOfJoining + "\t\t" + e3.salary + "\t" + e3.address);
    }
}
