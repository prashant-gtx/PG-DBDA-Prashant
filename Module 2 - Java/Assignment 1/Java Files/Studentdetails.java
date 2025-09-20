class Student{
    String name;
    int rollno;

    void setname(String name, int rollno){
        this.name=name;
        this.rollno=rollno;
    }
    void getname(){
        System.out.println("Name: "+name +"  roll no. "+rollno);
    }
}
public class Studentdetails{
    public static void main(String[] args) {
        Student s=new Student();
        s.setname("John", 2);
        s.getname();
    }
    
}