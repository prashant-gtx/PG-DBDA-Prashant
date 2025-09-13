class CurrencyConverter {
    private static final double inrToUsdRate = 0.012;
    private static final double inrToEurRate = 0.011;
    private static final double inrToGbpRate = 0.0097;
    double convertToUsd(double inr) {
        return inr * inrToUsdRate;
    }
    double convertToEur(double inr) {
        return inr * inrToEurRate;
    }
    double convertToGbp(double inr) {
        return inr * inrToGbpRate;
    }
}
public class CurrencyConverterDemo{
    public static void main(String[] args) {
        CurrencyConverter conv = new CurrencyConverter();
        double inr = 10000;
        System.out.println("INR to USD: " + conv.convertToUsd(inr));
        System.out.println("INR to EUR: " + conv.convertToEur(inr));
        System.out.println("INR to GBP: " + conv.convertToGbp(inr));
    }
}


