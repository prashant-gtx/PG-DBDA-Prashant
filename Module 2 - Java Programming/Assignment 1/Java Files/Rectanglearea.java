class Rectangle{
    int len;
    int br;

    void Area(int len,int br){
        this.len=len;
        this.br=br;
        int areaofrect=len*br;
        System.out.println("Area of rect: "+areaofrect+" with len: "+len+" and br: "+br);
    }
}
public class Rectanglearea{
    public static void main(String[] args){
        Rectangle ra = new Rectangle();
        ra.Area(4,5);
        ra.Area(5,8);
    }
}
