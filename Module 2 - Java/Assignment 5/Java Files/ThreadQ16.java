class LowercaseThread extends Thread {
    public void run() {
        for (char c = 'a'; c <= 'z'; c++) {
            System.out.println("Lowercase: " + c);
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                System.out.println("Lowercase thread interrupted.");
            }
        }
    }
}

class UppercaseThread extends Thread {
    public void run() {
        for (char c = 'A'; c <= 'Z'; c++) {
            System.out.println("Uppercase: " + c);
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                System.out.println("Uppercase thread interrupted.");
            }
        }
    }
}

public class ThreadQ16 {
    public static void main(String[] args) {
        LowercaseThread lower = new LowercaseThread();
        UppercaseThread upper = new UppercaseThread();

        lower.start();
        upper.start();
    }
}
