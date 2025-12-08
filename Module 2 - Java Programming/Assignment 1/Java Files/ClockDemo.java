import java.util.Scanner;

class Clock{
    int hours;
    int minutes; 
    int seconds;
    
    Clock(){
        hours=12;
        minutes=00;
        seconds=00;
    }
    Clock(int totalSeconds){
        hours = totalSeconds / 3600;
        int remainder = totalSeconds % 3600;
        minutes = remainder / 60;
        seconds = remainder % 60;
    }
    Clock(int hours,int minutes,int seconds){
       this.hours=hours;
       this.minutes=minutes;
       this.seconds=seconds; 
    }
    void setClock(int totalSeconds) {
        hours = totalSeconds / 3600;
        int remainder = totalSeconds % 3600;
        minutes = remainder / 60;
        seconds = remainder % 60;
    }

    int getHours(){
        return hours;
    } 
    int getMinutes(){
        return minutes;
    }
    int getSeconds(){
        return seconds;
    }
    void getHours(int hours){
        this.hours=hours;
    } 
    void getMinutes(int minutes){
        this.minutes=minutes;
    }
    void getSeconds(int seconds){
        this.seconds=seconds;
    }
    void tick() {
        seconds++;
        if (seconds == 60) {
            seconds = 0;
            minutes++;
        }
        if (minutes == 60) {
            minutes = 0;
            hours++;
        }
        if (hours == 24) {
            hours = 0;
        }
    }
    public void addClock(Clock other) {
        this.seconds += other.seconds;
        this.minutes += other.minutes + this.seconds / 60;
        this.seconds = this.seconds % 60;

        this.hours += other.hours + this.minutes / 60;
        this.minutes = this.minutes % 60;

        this.hours = this.hours % 24;  
    }
    @Override
    public String toString(){
        return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    }
    public void tickDown() {
        seconds--;
        if (seconds < 0) {
            seconds = 59;
            minutes--;
            if (minutes < 0) {
                minutes = 59;
                hours--;
                if (hours < 0) {
                    hours = 23;
                }
            }
        }
    }

    public Clock subtractClock(Clock other) {
        int diffSeconds = Math.abs(this.toTotalSeconds() - other.toTotalSeconds());

        if (diffSeconds >= 24 * 3600) {
            diffSeconds %= 24 * 3600;
        }

        return new Clock(diffSeconds);
    }

    private int toTotalSeconds() {
        return hours * 3600 + minutes * 60 + seconds;
    }
}
public class ClockDemo{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter time in seconds since midnight for firstClock: ");
        int secondsSinceMidnight = sc.nextInt();
        Clock firstClock = new Clock(secondsSinceMidnight);

        System.out.println("Ticking firstClock 10 times:");
        for (int i = 0; i < 10; i++) {
            firstClock.tick();
            System.out.println("Tick " + (i + 1) + ": " + firstClock);
        }
        System.out.println();

        System.out.print("Enter hours for secondClock: ");
        int h = sc.nextInt();
        System.out.print("Enter minutes for secondClock: ");
        int m = sc.nextInt();
        System.out.print("Enter seconds for secondClock: ");
        int s = sc.nextInt();
        Clock secondClock = new Clock(h, m, s);

        System.out.println("Ticking secondClock 10 times:");
        for (int i = 0; i < 10; i++) {
            secondClock.tick();
            System.out.println("Tick " + (i + 1) + ": " + secondClock);
        }
        System.out.println();

        firstClock.addClock(secondClock);

        System.out.println("After adding secondClock to firstClock:");
        System.out.println("firstClock: " + firstClock);
        System.out.println("secondClock: " + secondClock);
        System.out.println();

        Clock thirdClock = firstClock.subtractClock(secondClock);
        System.out.println("Difference (thirdClock): " + thirdClock);

        sc.close();
    }
}