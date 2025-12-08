class MyThread extends Thread {
    public void run() {
        System.out.println("Thread is running: " + this.getName());
    }
}

public class ThreadQ4 {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();
        t1.setName("Child-1");

        MyThread t2 = new MyThread();
        t2.setName("Child-2");

        System.out.println("Main Thread name: " + Thread.currentThread().getName());

        t1.start();
        t2.start();
    }
}
