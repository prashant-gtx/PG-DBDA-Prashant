import java.util.Scanner;

class Average{
    int a,b,c;

    Average(int a,int b,int c){
        this.a=a;
        this.b=b;
        this.c=c;
        double average=(a+b+c)/3;
        System.out.println("Average of three numbers: "+average);
    }
}
public class Averageabc2{

    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        System.out.println("enter no 1: ");
        int a=sc.nextInt();

        System.out.println("enter no 2: ");
        int b=sc.nextInt();

        System.out.println("enter no 3: ");
        int c=sc.nextInt();

        Average av=new Average(a,b,c);
        System.out.println("area: " + av);
    }
}