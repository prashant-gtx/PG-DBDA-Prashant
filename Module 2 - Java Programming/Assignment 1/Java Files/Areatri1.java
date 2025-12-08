
class Triangle {
    int s1, s2 , s3;
    Triangle(int s1,int s2,int s3) {
         this.s1=s1;
        this.s2=s2;
        this.s3=s3;

        double area = (s1+s2+s3)/2;
        System.out.println("area of triangle = " + area);
    }
    void perimeter(int s1,int s2,int s3) {
        this.s1=s1;
        this.s2=s2;
        this.s3=s3;
        System.out.println("perimeter = " + (s1 + s2 + s3));
    }
}
public class Areatri1{ 
    public static void main(String[] args) {
        Triangle t = new Triangle(3,4,5);
        t.perimeter(3,4,5);
    }
}
