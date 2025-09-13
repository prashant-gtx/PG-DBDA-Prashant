class BankAccount{
    double accountNumber;
    String holderName;
    int balance;

    BankAccount(double accountNumber){
        System.out.println("Account Number : "+accountNumber);
    }
    BankAccount(double accountNumber,String holderName){
        this(accountNumber);
        System.out.println("Account Number : "+accountNumber+ " Account Holder : "+holderName);
    }
    BankAccount(double accountNumber,String holderName,int balance){
        this(accountNumber,holderName);
        System.out.println("Account Number : "+accountNumber+ " Account Holder : "+holderName+ " Balance : "+balance);
    }
}
public class BankDetails{
    public static void main(String[] args) {
        BankAccount ba1 = new BankAccount(254631897);
        BankAccount ba2 = new BankAccount(254631897,"xyz");
        BankAccount ba3 = new BankAccount(254631897,"xyz",4563258);
    }
}