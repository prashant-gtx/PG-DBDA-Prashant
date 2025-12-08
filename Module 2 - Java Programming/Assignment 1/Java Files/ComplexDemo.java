import java.util.Scanner;

class Complex {
    private double real;
    private double imag;

    public Complex(double real, double imag) {
        this.real = real;
        this.imag = imag;
    }
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imag + other.imag);
    }
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imag - other.imag);
    }
    public Complex multiply(Complex other) {
        double r = this.real * other.real - this.imag * other.imag;
        double i = this.real * other.imag + this.imag * other.real;
        return new Complex(r, i);
    }

    @Override
    public String toString() {
        if (imag >= 0)
            return real + " + " + imag + "i";
        else
            return real + " - " + (-imag) + "i";
    }
}
public class ComplexDemo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter real part of first complex number: ");
        double r1 = sc.nextDouble();
        System.out.print("Enter imaginary part of first complex number: ");
        double i1 = sc.nextDouble();

        System.out.print("Enter real part of second complex number: ");
        double r2 = sc.nextDouble();
        System.out.print("Enter imaginary part of second complex number: ");
        double i2 = sc.nextDouble();

        Complex c1 = new Complex(r1, i1);
        Complex c2 = new Complex(r2, i2);

        Complex sum = c1.add(c2);
        Complex diff = c1.subtract(c2);
        Complex prod = c1.multiply(c2);

        System.out.println("Sum: " + sum);
        System.out.println("Difference: " + diff);
        System.out.println("Product: " + prod);
    }
}
