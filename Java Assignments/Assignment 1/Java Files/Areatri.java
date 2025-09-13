class Triangle {
    int s1 = 3, s2 = 4, s3 = 5;

    void area() {
        double areaoft = (s1+s2+s3)/2;
        System.out.println("area of triangle = " + areaoft);
    }
    void perimeter() {
        System.out.println("perimeter = " + (s1 + s2 + s3));
    }
}
public class Areatri{
    public static void main(String[] args) {
        Triangle t = new Triangle();
        t.area();
        t.perimeter();
    }
}
