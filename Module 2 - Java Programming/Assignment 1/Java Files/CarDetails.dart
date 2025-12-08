class Car{
    String brand;
    String model;
    int price;

    car(String brand){
        this.price=price;
    }
    car(String brand,String model){
        this(String brand);
        this.brand=brand;
        this.model=model;
    }
    car(String brand,String model,int price){
        this(String brand,String model);
        this.brand=brand;
        this.model=model;
        System.out.println("Brand :  "+brand);
        System.out.println("Model :  "+model);
        System.out.println("Price :  "+price);
    }
}

public class CarDetails{
    public static void main(String args[]){
        
    }
} 