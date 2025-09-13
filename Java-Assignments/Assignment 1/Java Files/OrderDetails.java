class Order{
    double orderId;
    String customerName;
    double totalAmount;

    Order(double orderId){
        this.orderId=orderId;
        System.out.println("This is one parameter Order Id : "+orderId);
    }
    Order(double orderId,String customerName){
        this(orderId);
        this.orderId=orderId;
        this.customerName=customerName;
        System.out.println("This is Two parameter Order Id : "+orderId + " and Customer Name : "+customerName);
    }
    Order(double orderId,String customerName,double totalAmount){
        this(orderId,customerName);
        this.orderId=orderId;
        this.customerName=customerName;
        this.totalAmount=totalAmount;
        System.out.println("This is Three parameter Order Id : "+orderId + " Customer Name : "+customerName+ " and Total Amount : "+totalAmount);
    }
}
public class OrderDetails{
    public static void main(String[] args) {
        Order or1 = new Order(1235);
        Order or2 = new Order(1235,"Alice");
        Order or3 = new Order(1235,"Alice",8456);
    }
}
