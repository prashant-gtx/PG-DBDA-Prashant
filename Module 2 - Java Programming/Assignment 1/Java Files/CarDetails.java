class Car{
    String brand;
    String model;
    int price;
    Car(String brand){
        this.brand=brand;
        System.out.println("Brand :  "+brand);
        System.out.println("--------");
    }
    Car(String brand,String model){
        this(brand);
        this.model=model;
        System.out.println("Brand :  "+brand);
        System.out.println("Model :  "+model);
        System.out.println("--------");
    }
    Car(String brand,String model,int price){
        this(brand,model);
        this.price=price;
        System.out.println("Brand :  "+brand);
        System.out.println("Model :  "+model);
        System.out.println("Price :  "+price);
        System.out.println("--------");
    }
}
public class CarDetails{
    public static void main(String args[]){
        Car c3=new Car("BMW");
        Car c2=new Car("BMW","XYZ");
        Car c1=new Car("BMW","XYZ",1236548);
    }
} 