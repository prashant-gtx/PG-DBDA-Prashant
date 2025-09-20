class Student {
    String name;
    int Roll_no;
    int phn_no;
    String add;
    Student(String name, int Roll_no, int phn_no, String add) {
        this.name = name;
        this.Roll_no = Roll_no;
        this.phn_no = phn_no;
        this.add = add;
    }
    void display() {
        System.out.println("name: " + name + " rollno: " + " phn no: " + phn_no + " address: " + add);
    }        
}
public class studentdetails2 {
    public static void main(String[] args) {
        Student s = new Student("john", 2, 988524521, "Navi-mumbai");
        Student s2 = new Student("Sam", 3, 1238545311, "pune");
        s.display();
        s2.display();
    }
}
