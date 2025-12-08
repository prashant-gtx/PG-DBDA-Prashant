class Vehicle {
    String type;

    Vehicle(String type){
        this.type=type;
    }
}
class FourWheeler extends Vehicle{
    String brand;

    FourWheeler(String type,String brand){
        super(type);
        this.brand=brand;
    }
}
class Car extends FourWheeler{
    String model;
    int price;

    Car(String type,String brand,String model,int price){
        super(type,brand);
        this.model=model;
        this.price=price;
        System.out.println("Type : "+type);
        System.out.println("Brand :  "+brand);
        System.out.println("Model :  "+model);
        System.out.println("Price :  "+price);
    }
}
public class MultilevelChaining{
    public static void main(String[] args) {
        Car c=new Car("XYZ","BMW","A4",1236548);
    }
}