import java.time.LocalTime;

class TimeThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Current Time: " + LocalTime.now());
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                System.out.println("TimeThread interrupted.");
            }
        }
    }
}

public class ThreadQ19 {
    public static void main(String[] args) {
        TimeThread t1 = new TimeThread();
        t1.start();
    }
}
