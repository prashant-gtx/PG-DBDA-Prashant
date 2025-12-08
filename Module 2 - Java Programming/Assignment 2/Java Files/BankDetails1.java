class Bank{
    void getInterestRate(int rate){
        System.out.println("Interest Rate : "+rate);
    }
}
class SBI extends Bank{
    void getInterestRate(int rate){
        System.out.println("Interest Rate of SBI : " + rate + "%");
    }
}
class HDFC extends Bank{
    void getInterestRate(int rate){
        System.out.println("Interest Rate OF HDFC : " + rate + "%");
    }
}
class ICICI extends Bank{
    void getInterestRate(int rate){
        System.out.println("Interest Rate OF ICICI : " + rate + "%");
    }
}
public class BankDetails1{
    public static void main(String[] args) {
        SBI sbi =new SBI();
        HDFC hdfc = new HDFC();
        ICICI icici = new ICICI();

        sbi.getInterestRate(6);
        hdfc.getInterestRate(5);
        icici.getInterestRate(4);
    }
}