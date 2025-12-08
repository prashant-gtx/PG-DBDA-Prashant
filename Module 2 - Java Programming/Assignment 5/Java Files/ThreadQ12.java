class MyThread extends Thread {
    private String message;

    public MyThread(String message) {
        this.message = message;
    }

    public void run() {
        for (int i = 1; i <= 3; i++) {
            System.out.println(message + " (Iteration " + i + ")");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println(message + " interrupted.");
            }
        }
    }
}

public class ThreadQ12 {
    public static void main(String[] args) {
        MyThread t1 = new MyThread("Thread 1: Hello");
        MyThread t2 = new MyThread("Thread 2: Welcome");
        MyThread t3 = new MyThread("Thread 3: Good Morning");

        t1.start();
        t2.start();
        t3.start();
    }
}
