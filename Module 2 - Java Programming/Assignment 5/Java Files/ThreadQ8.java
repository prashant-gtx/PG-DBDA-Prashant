class ChildThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("child Thread: " + i);
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                System.out.println("Child thread interrupted");
            }
        }
    }
}

public class ThreadQ8 {
    public static void main(String[] args) {
        ChildThread child = new ChildThread();
        child.start();

        try {
            child.join();
        } catch (InterruptedException e) {
            System.out.println("main thread interrupted while waiting");
        }

        System.out.println("main thread: child finished.... now continuing");
    }
}
