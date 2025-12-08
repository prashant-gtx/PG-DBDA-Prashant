
class Triangle {
    int s1, s2 , s3;
    void area(int s1,int s2,int s3) {
         this.s1=s1;
        this.s2=s2;
        this.s3=s3;

        double areaoft = (s1+s2+s3)/2;
        System.out.println("area of triangle=" + areaoft);
    }
    void perimeter(int s1,int s2,int s3) {
        this.s1=s1;
        this.s2=s2;
        this.s3=s3;
        System.out.println("perimeter=" + (s1 + s2 + s3));
    }
}
public class Areatri{ 
    public static void main(String[] args) {
        Triangle t = new Triangle();
        t.area(3,4,5);
        t.perimeter(3,4,5);
    }
}
