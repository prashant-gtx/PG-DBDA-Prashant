class Laptop{
    private String brand;
    private int price;

    void setValue(String brand,int price){
        this.brand=brand;
        if (price != 0){
            this.price=price;
        }
        else{
            System.out.println("Enter valid price ");
        }
    }
    String getValue(){
        return brand+" "+price ;
    }
}
public class LaptopDetails{
    public static void main(String[] args) {
        Laptop l = new Laptop();
        l.setValue("Acer", 0);
        System.out.println("Brand and Price: "+l.getValue());
    }
}