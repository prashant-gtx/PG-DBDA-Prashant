class Calculator{
    int multiply(int a,int b){
        return (a*b);
    }
    double multiply(int a,double c){
        return (a*c);
    }
    double multiply(double a,double b){
        return (a*b);
    }
}
public class multiplaction{
    public static void main(String[] args) {
        Calculator m=new Calculator();
        System.out.println("multiply 2 * 3: "+ m.multiply(2, 3));
        System.out.println("multiply 4 * 3.6: "+ m.multiply(4,3.6));
        System.out.println("multiply 10 * 45: "+ m.multiply(10, 45));
    }
}