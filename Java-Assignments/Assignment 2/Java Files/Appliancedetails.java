abstract class Appliance{
    abstract void turnOn();
    abstract void turnOff();
}
class Fan extends Appliance{
    void turnOn(){
        System.out.println("Fan is On");
    }
    void turnOff(){
        System.out.println("Fan is Off");
    }
}
class Light extends Appliance{
    void turnOn(){
        System.out.println("Light is On");
    }
    void turnOff(){
        System.out.println("Light is Off");
    }
}
public class Appliancedetails{
    public static void main(String[] args) {
        Fan f =new Fan();
        Light l =new Light();
        f.turnOn();
        f.turnOff();
        l.turnOn();
        l.turnOff();
    }
}