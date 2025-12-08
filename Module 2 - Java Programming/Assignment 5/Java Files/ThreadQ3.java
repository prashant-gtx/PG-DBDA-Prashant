class ChildThread extends Thread {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Child Thread Running");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println("Child thread interrupted.");
            }
        }
    }
}

public class ThreadQ3 {
    public static void main(String[] args) {
        ChildThread child = new ChildThread();
        child.start();

        for (int i = 0; i < 5; i++) {
            System.out.println("Main Thread Running");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println("Main thread interrupted.");
            }
        }
    }
}
