class Printer{
    void Print(int a,int b){
        System.out.println("Integer number : "+ a + b);
    }
    void Print(String str){
        System.out.println("String : "+ str);
    }
    void Print(double a,double b){
        System.out.println("Double : "+ a + b);
    }
}
public class Overloading1{
    public static void main(String[] args) {
        Printer p=new Printer();
        p.Print(11, 12);
        p.Print("Hii My Name is Prashant");
        p.Print(10.25, 45.48563);
    }
}