class Matrix {
    private int numRows;
    private int numCols;
    private int[][] elements;

    public Matrix(int numRows, int numCols) {
        this.numRows = numRows;
        this.numCols = numCols;
        this.elements = new int[numRows][numCols];
    }

    public int getNumRows() {
        return numRows;
    }
    public int getNumCols() {
        return numCols;
    }
    public void setElement(int row, int col, int value) {
        if (row >= 0 && row < numRows && col >= 0 && col < numCols) {
            elements[row][col] = value;
        } else {
            System.out.println("Index out of bounds");
        }
    }
    public int getElement(int row, int col) {
        if (row >= 0 && row < numRows && col >= 0 && col < numCols) {
            return elements[row][col];
        }
        throw new IndexOutOfBoundsException("Invalid index");
    }
}

public class Matrices1 {
    public static void main(String[] args) {
        Matrix matrix = new Matrix(3, 3);

        matrix.setElement(0, 0, 10);
        matrix.setElement(0, 1, 20);
        matrix.setElement(0, 2, 30);
        matrix.setElement(1, 0, 40);
        matrix.setElement(1, 1, 50);
        matrix.setElement(1, 2, 60);
        matrix.setElement(2, 0, 70);
        matrix.setElement(2, 1, 80);
        matrix.setElement(2, 2, 90);

        for (int i = 0; i < matrix.getNumRows(); i++) {
            for (int j = 0; j < matrix.getNumCols(); j++) {
                System.out.print(matrix.getElement(i, j) + " ");
            }
            System.out.println();
        }
    }
}
