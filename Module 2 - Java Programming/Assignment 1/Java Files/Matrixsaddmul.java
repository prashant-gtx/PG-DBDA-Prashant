class Matrix{
    private int rows;
    private int cols;
    private int[][] data;

    public Matrix(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
        this.data = new int[rows][cols];
    }

    public int getRows() {
        return rows;
    }

    public int getCols() {
        return cols;
    }

    public void setElement(int i, int j, int value) {
        if (i >= 0 && i < rows && j >= 0 && j < cols) {
            data[i][j] = value;
        } else {
            System.out.println("Index out of bounds");
        }
    }

    public int getElement(int i, int j) {
        if (i >= 0 && i < rows && j >= 0 && j < cols) {
            return data[i][j];
        }
        throw new IndexOutOfBoundsException("Invalid index");
    }

    public Matrix add(Matrix other) {
        if (this.rows != other.rows || this.cols != other.cols) {
            System.out.println("Matrices cannot be added");
            return null;
        }

        Matrix result = new Matrix(rows, cols);
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                result.data[i][j] = this.data[i][j] + other.data[i][j];
            }
        }
        return result;
    }

    public Matrix multiply(Matrix other) {
        if (this.cols != other.rows) {
            System.out.println("Matrices cannot be multiplied");
            return null;
        }

        Matrix result = new Matrix(this.rows, other.cols);
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < other.cols; j++) {
                int sum = 0;
                for (int k = 0; k < this.cols; k++) {
                    sum += this.data[i][k] * other.data[k][j];
                }
                result.data[i][j] = sum;
            }
        }
        return result;
    }

    public void printMatrix() {
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                System.out.print(data[i][j] + " ");
            }
            System.out.println();
        }
    }
}

public class Matrixsaddmul{
    public static void main(String[] args) {

        Matrix m1 = new Matrix(3, 3);

        m1.setElement(0, 0, 1);
        m1.setElement(0, 1, 2);
        m1.setElement(0, 2, 3);
        m1.setElement(1, 0, 4);
        m1.setElement(1, 1, 5);
        m1.setElement(1, 2, 6);
        m1.setElement(2, 0, 7);
        m1.setElement(2, 1, 8);
        m1.setElement(2, 2, 9);

        Matrix m2 = new Matrix(3, 3);

        m2.setElement(0, 0, 9);
        m2.setElement(0, 1, 8);
        m2.setElement(0, 2, 7);
        m2.setElement(1, 0, 6);
        m2.setElement(1, 1, 5);
        m2.setElement(1, 2, 4);
        m2.setElement(2, 0, 3);
        m2.setElement(2, 1, 2);
        m2.setElement(2, 2, 1);

        Matrix sum = m1.add(m2);
        if (sum != null) {
            System.out.println("Sum of matrices:");
            sum.printMatrix();
        }

        Matrix product = m1.multiply(m2);
        if (product != null) {
            System.out.println("Product of matrices:");
            product.printMatrix();
        }
    }
}
