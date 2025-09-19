class MyThread extends Thread {
    public void run() {
        System.out.println("Running in: " + Thread.currentThread().getName());
    }
}

public class ThreadQ13 {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();

        System.out.println("Calling run() directly:");
        t1.run();

        System.out.println("Calling start():");
        t1.start();
    }
}
