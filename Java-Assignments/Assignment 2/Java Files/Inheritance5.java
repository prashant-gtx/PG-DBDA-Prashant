class Shape{
    int r;
    void area(int r){
        this.r=r;
        System.out.println("This is Shape class");
    }
}
class Circle extends Shape{
    int r;
    //int arc;
    Circle(int r){
        this.r=r;
    }
    void area(){
        double arc = 3.14*(r*r);
        System.out.println("Area of clircle : "+ arc);
    }
}
class Rectange extends Shape{
    int l;
    int b;
    Rectange(int l,int b){
        this.l=l;
        this.b=b;
    }
    void area(){
        System.out.println("Area of Rectangle : "+ l*b);
    }
}
public class Inheritance5{
    public static void main(String[] args) {
        Circle c = new Circle(4);
        c.area();

        Rectange r=new Rectange(2,5);
        r.area();
    }
}