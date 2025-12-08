class MyThread extends Thread {
    private volatile boolean running = true;

    public void run() {
        int i = 1;
        while (running) {
            System.out.println("Thread running... Count: " + i++);
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                System.out.println("Thread interrupted.");
            }
        }
        System.out.println("Thread stopped gracefully.");
    }
    public void stopThread() {
        running = false;
    }
}
public class ThreadQ15 {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();
        t1.start();

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Requesting thread to stop...");
        t1.stopThread();
    }
}
