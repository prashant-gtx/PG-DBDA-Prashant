abstract class Payment{
    abstract void payAmount();
}
class CreditCardPayment extends Payment{
    void payAmount(){
        System.out.println("This is CreditCardPayment....");
    }
}
class UPIPayment extends Payment{
    void payAmount(){
        System.out.println("This is UPIPayment....");
    }
}
public class PaymentActivity{
    public static void main(String[] args) {
        CreditCardPayment ccp =new CreditCardPayment();
        UPIPayment upi = new UPIPayment();
        ccp.payAmount();
        upi.payAmount();
    }
}