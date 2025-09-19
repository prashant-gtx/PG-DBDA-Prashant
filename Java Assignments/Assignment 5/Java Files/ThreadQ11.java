class EvenThread extends Thread {
    public void run() {
        for (int i = 2; i <= 20; i += 2) {
            System.out.println("Even: " + i);
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                System.out.println("EvenThread interrupted.");
            }
        }
    }
}
class OddThread extends Thread {
    public void run() {
        for (int i = 1; i < 20; i += 2) {
            System.out.println("Odd: " + i);
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                System.out.println("OddThread interrupted.");
            }
        }
    }
}
public class ThreadQ11 {
    public static void main(String[] args) {
        EvenThread even = new EvenThread();
        OddThread odd = new OddThread();

        even.start();
        odd.start();
    }
}
