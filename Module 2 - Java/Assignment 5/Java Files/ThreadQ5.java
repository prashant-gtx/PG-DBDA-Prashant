class MyThread extends Thread {
    public MyThread(String name) {
        super(name);
    }

    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println(getName() + " running with priority " + getPriority());
            try {
                Thread.sleep(400); 
            } catch (InterruptedException e) {
                System.out.println(getName() + " interrupted.");
            }
        }
    }
}

public class ThreadQ5 {
    public static void main(String[] args) {
        MyThread t1 = new MyThread("Thread-1");
        MyThread t2 = new MyThread("Thread-2");

        t1.setPriority(Thread.MIN_PRIORITY); 
        t2.setPriority(Thread.MAX_PRIORITY); 

        System.out.println(t1.getName() + " priority: " + t1.getPriority());
        System.out.println(t2.getName() + " priority: " + t2.getPriority());

        t1.start();
        t2.start();
    }
}
