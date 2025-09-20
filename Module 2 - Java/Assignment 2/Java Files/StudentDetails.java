class Student1{
    private String name;
    private int marks;

    void setValue(String name,int marks){
        this.name=name;
        this.marks=marks;
    }
    String getValue(){
        return name+" "+marks ;
    }
}
public class StudentDetails{
    public static void main(String[] args) {
        Student1 S = new Student1();
        S.setValue("Neha", 55);
        System.out.println("Name and Marks : "+S.getValue());
    }
}