class Browser{
    void openWebsite(){
        System.out.println("This is openWebsite....");
    }
}
class Chrome extends Browser{
    void openWebsite(){
        System.out.println("This is Chrome openWebsite....");
    }
}
class Firefox extends Browser{
    void openWebsite(){
        System.out.println("This is Firefox openWebsite....");
    }
}
public class openWebsite{
    public static void main(String[] args) {
        Chrome c = new Chrome();
        Firefox f =new Firefox();
        c.openWebsite();
        f.openWebsite();
    }
}