class Phone{
    void call(){
        System.out.println("This is Phone call....");
    }
}
class Smartphone extends Phone{
    void call(){
        System.out.println("This is SmartPhone call....");
    }
}
class Landline extends Phone{
    void call(){
        System.out.println("This is Landline call....");
    }
}
public class Calls{
    public static void main(String[] args) {
        Smartphone sp = new Smartphone();
        Landline l =new Landline();
        sp.call();
        l.call();
    }
}