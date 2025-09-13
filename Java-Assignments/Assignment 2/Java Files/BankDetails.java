class BankAccount{
    private double accountNumber;
    private double balance;

    void setValue(double accountNumber,double balance){
        this.accountNumber=accountNumber;
        this.balance=balance;
    }
    String getValue(){
        return accountNumber+" "+balance ;
    }
}
public class BankDetails{
    public static void main(String[] args) {
        BankAccount ba = new BankAccount();
        ba.setValue(115232346, 8005694);
        System.out.println("Bank Details : "+ba.getValue());
    }
}