class LearningThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Learning Java");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println("LearningThread interrupted.");
            }
        }
    }
}
class MultithreadingThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Multithreading in action");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println("MultithreadingThread interrupted.");
            }
        }
    }
}
public class ThreadQ20 {
    public static void main(String[] args) {
        LearningThread t1 = new LearningThread();
        MultithreadingThread t2 = new MultithreadingThread();

        t1.start();
        t2.start();
    }
}
