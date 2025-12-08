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
        Super(name,age);
        this.course=course;
    }
}
public class ConstructorChaining{
    
}