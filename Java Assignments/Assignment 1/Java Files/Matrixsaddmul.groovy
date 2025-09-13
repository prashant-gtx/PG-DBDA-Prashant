class Matrix{
    int rows;
    int columns;
    void getRows(){
        this.rows=rows;
    }
    void getColumns(){
        this.columns=columns;
    }
    void setElemnet(int rows,int columns){
        int matrix[rows][columns];
    }
    void addMatrix(int a, int b){
        int c[rows][columns];
        if (a.length == b.length){
            for(int i=0;i<rows;i++){
                for(int j=0;j<columns;j++){
                    c[i][j]=a[i][j] + b[i][j];
                }
            }
        }
        else {
            System.out.println("Matrixs are not add able ");
        }
    }

    void mulMatrix(int a, int b){
        int c[rows][columns];
        if (a.length == b.length){
            for(int i=0;i<rows;i++){
                for(int j=0;j<columns;j++){
                    c[i][j]=a[i][j] * b[i][j];
                }
            }
        }
        else {
            System.out.println("Matrixs are not Multiplyable ");
        }
    }
}

public class Matrixsaddmul{
    
}