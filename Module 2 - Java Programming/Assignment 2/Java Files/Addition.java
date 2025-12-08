class MathOperation{
    int add(int a,int b){
        return (a+b);
    }
    int add(int a,int b, int c){
        return (a+b+c);
    }
    double add(double a,double b){
        return (a+b);
    }
}
public class Addition{
    public static void main(String[] args) {
        MathOperation m=new MathOperation();
        System.out.println("Add 2 + 3: "+ m.add(2, 3));
        System.out.println("Add 4 + 3 + 6: "+ m.add(4,3,6));
        System.out.println("Add 10 + 45: "+ m.add(10, 45));
    }
}