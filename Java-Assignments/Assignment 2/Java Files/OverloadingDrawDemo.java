class Shape {
    void draw() {
        System.out.println("Drawing a generic shape");
    }
    void draw(int radius) {
        System.out.println("Drawing a circle with radius: " + radius);
    }
    void draw(int length, int breadth) {
        System.out.println("Drawing a rectangle with length: " + length + " and breadth: " + breadth);
    }
    void draw(int side1, int side2, int side3) {
        System.out.println("Drawing a triangle with sides: " + side1 + ", " + side2 + ", " + side3);
    }
}
public class OverloadingDrawDemo{
    public static void main(String[] args) {
        Shape s = new Shape();
        s.draw();
        s.draw(5); 
        s.draw(10, 20); 
        s.draw(3, 4, 5);
    }
}
