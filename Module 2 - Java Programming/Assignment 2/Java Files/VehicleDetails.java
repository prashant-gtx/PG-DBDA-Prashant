class Vehicle{
    String brand;
    int speed;
    Vehicle(String brand,int speed){
        this.brand=brand;
        this.speed=speed;
    }
}
class Car extends Vehicle{
    String fuelType;
    Car(String brand,int speed,String fuelType){
        super(brand,speed);
        this.fuelType=fuelType;
    }
    void displayCarDetails(){
        System.out.println("Brand : "+brand);
        System.out.println("Speed : "+speed);
        System.out.println("Fule Type : "+fuelType);
    }
}
public class VehicleDetails{
    public static void main(String args[]){
        Car c = new Car("BMW",200,"Petrol");
        c.displayCarDetails();
    }
}