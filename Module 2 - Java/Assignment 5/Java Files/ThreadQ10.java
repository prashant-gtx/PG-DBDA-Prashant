class GoodMorningThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Good Morning");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println("Good Morning Thread interrupted");
            }
        }
    }
}

class WelcomeThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Welcome");
            try {
                Thread.sleep(400);
            } catch (InterruptedException e) {
                System.out.println("Welcome Thread interrupted");
            }
        }
    }
}

public class ThreadQ10 {
    public static void main(String[] args) {
        GoodMorningThread t1 = new GoodMorningThread();
        WelcomeThread t2 = new WelcomeThread();

        t1.start();
        t2.start();
    }
}
