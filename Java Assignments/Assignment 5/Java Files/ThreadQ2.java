class MyRunnable implements Runnable {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Number: " + i);
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                System.out.println("Thread was interrupted.");
            }
        }
    }
}

public class ThreadQ2 {
    public static void main(String[] args) {
        MyRunnable task = new MyRunnable();
        Thread t1 = new Thread(task);
        t1.start();
    }
}
