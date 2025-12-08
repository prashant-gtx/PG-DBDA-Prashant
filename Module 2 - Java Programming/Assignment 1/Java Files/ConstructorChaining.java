class Person{
    String name;
    int age;

    Person(String name,int age){
        this.name=name;
        this.age=age;
    }
}
class Student extends Person{
    String course;

    Student(String name,int age,String course){
        super(name,age);
        this.course=course;
        System.out.println("name :  "+name);
        System.out.println("age :  "+age);
        System.out.println("course :  "+course);
    }
}
public class ConstructorChaining{
    public static void main(String[] args) {
        Student s=new Student("Prashant",21,"PG-DBDA");
    }
}