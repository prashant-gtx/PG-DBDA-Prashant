class SumThread extends Thread {
    private int sum = 0;

    public void run() {
        for (int i = 1; i <= 100; i++) {
            sum += i;
        }
        System.out.println("Sum of numbers from 1 to 100 = " + sum);
    }
}

public class ThreadQ14 {
    public static void main(String[] args) {
        SumThread t1 = new SumThread();
        t1.start();
    }
}
