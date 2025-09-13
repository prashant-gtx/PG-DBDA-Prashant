class Car{
    private String Model;
    private int year;
    private int price;

    void setValue(String Model,int year,int price){
        this.Model=Model;
        this.year=year;
        this.price=price;
    }
    String getValue(){
        return Model+" "+year+" "+price ;
    }
}
public class CarDetails{
    public static void main(String[] args) {
        Car c = new Car();
        c.setValue("BMW", 2025, 156000);
        System.out.println("Model and year and price: "+c.getValue());
    }
}