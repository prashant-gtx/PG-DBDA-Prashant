class MyThread extends Thread {
    public void run() {
        for (int i = 1; i <= 3; i++) {
            System.out.println("Child Thread: " + i);
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                System.out.println("Child Thread interrupted.");
            }
        }
    }
}

public class ThreadQ9 {
    public static void main(String[] args) {
        MyThread t = new MyThread();

        System.out.println("Before starting, is t alive? " + t.isAlive());

        t.start();
        System.out.println("After starting, is t alive? " + t.isAlive());

        try {
            t.join();
        } catch (InterruptedException e) {
            System.out.println("Main Thread interrupted.");
        }

        System.out.println("After completion, is t alive? " + t.isAlive());
        System.out.println("Main Thread ending.");
    }
}
