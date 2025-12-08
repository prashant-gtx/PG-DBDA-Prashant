abstract class Shape {
    abstract void calculate();
}

class Circle extends Shape {
    int r;
    Circle(int r) {
        this.r = r;
    }
    void calculate() {
        int res = (int) (3.14 * r * r);
        System.out.println("Circle area: " + res);
    }
}

class Rectangle extends Shape {
    int l, b;
    Rectangle(int l, int b) {
        this.l = l;
        this.b = b;
    }
    void calculate() {
        System.out.println("Rectangle area: " + (l * b));
    }
}

public class Abstraction2 {
    public static void main(String[] args) {
        Shape c = new Circle(4);
        Shape r = new Rectangle(5, 6);
        c.calculate();
        r.calculate();
    }
}
