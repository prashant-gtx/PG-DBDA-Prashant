
import java.util.Scanner;

class RectArea {
    int len;
    int br;
    void getArea() {
        int areaofrect = len * br;
        System.out.println("Area of rect: " + areaofrect + " with len: " + len + " and br: " + br);
    }
    void setDim(int len, int br) {
        this.len = len;
        this.br = br;
    }
}
public class Area11{
    public static void main(String[] args) {
         Scanner sc = new Scanner(System.in);

        System.out.println("Enter len: ");
        int len = sc.nextInt();

        System.out.println("enter br: ");
        int br = sc.nextInt();

        RectArea a = new RectArea(len, br);
        System.out.println("area: " + a.returnArea());
    }
}