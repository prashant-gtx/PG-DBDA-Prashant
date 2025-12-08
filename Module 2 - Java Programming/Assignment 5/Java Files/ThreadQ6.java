class FirstThread extends Thread {
    public void run() {
        for (int i = 1; i <= 10; i++) {
            System.out.println("First Thread: " + i);
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                System.out.println("First Thread interrupted.");
            }
        }
    }
}
class SecondThread extends Thread {
    public void run() {
        for (int i = 11; i <= 20; i++) {
            System.out.println("Second Thread: " + i);
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                System.out.println("Second Thread interrupted.");
            }
        }
    }
}
public class ThreadQ6 {
    public static void main(String[] args) {
        FirstThread t1 = new FirstThread();
        SecondThread t2 = new SecondThread();
        t1.start();
        t2.start();
    }
}
