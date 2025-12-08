abstract class Shape {
    abstract void calculate(int r);
    abstract void calculate(int l, int b);
}

class Circle extends Shape {
    void calculate(int r) {
        int res = (int) (3.14 * r * r);
        System.out.println("Calculate the Circle area: " + res);
    }

    @Override
    void calculate(int l, int b) {
        throw new UnsupportedOperationException("Not supported for Circle");
    }
}

class Rectangle extends Shape {
    void calculate(int l, int b) {
        System.out.println("Calculate the Rectangle area: " + (l * b));
    }

    @Override
    void calculate(int r) {
        throw new UnsupportedOperationException("Not supported for Rectangle");
    }
}

public class Abstraction2{
    public static void main(String[] args) {
        Circle c = new Circle();
        Rectangle r = new Rectangle();
        c.calculate(4);
        r.calculate(5, 6);
    }
}
