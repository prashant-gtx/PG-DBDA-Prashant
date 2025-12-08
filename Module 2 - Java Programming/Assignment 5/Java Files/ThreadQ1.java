class MyThread extends Thread {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Hello from Thread");
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                System.out.println("Thread was interrupted.");
            }
        }
    }
}

public class ThreadQ1 {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();
        t1.start();
    }
}
