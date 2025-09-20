abstract class Vehicle{
    abstract void start();
}
class Car extends Vehicle{
    void start(){
        System.out.println("Start the Car ...........");
    }
}
class Bike extends Vehicle{
    void start(){
        System.out.println("Start the Bike ...........");
    }
}
public class Abstarction{
    public static void main(String[] args) {
        Car c=new Car();
        Bike b=new Bike();
        c.start();
        b.start();
    }
}