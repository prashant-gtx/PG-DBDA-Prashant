//package Exam;
import java.util.*;

class Student {
    String enrollid;
    String studentname;
    String coursename;
    String credits;

    Student(String enrollid, String studentname, String coursename, String credits) {
        this.enrollid = enrollid;
        this.studentname = studentname;
        this.coursename = coursename;
        this.credits = credits;
    }

    public void setEnrollid(String enrollid) {
        this.enrollid = enrollid;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public void setCredits(String credits) {
        this.credits = credits;
    }

    public String getEnrollid() {
        return enrollid;
    }

    public void displaystuds() {
        System.out.println("Enrollment ID:" + enrollid + " | Student name:" + studentname +
                " | Course name: " + coursename + " | Credits:" + credits);
    }
}

public class Question1 {
    ArrayList<Student> stud = new ArrayList<Student>();
    Scanner sc = new Scanner(System.in);

    void addEnrollment() {
        System.out.println("Adding a new student to the system");
        System.out.print("Enter the Enrollment ID of the student: ");
        String enrollid = sc.nextLine();
        System.out.print("Enter the name of the student: ");
        String studentname = sc.nextLine();
        System.out.print("Enter the course of the student: ");
        String coursename = sc.nextLine();
        System.out.print("Enter the credits for the student: ");
        String credits = sc.nextLine();
        stud.add(new Student(enrollid, studentname, coursename, credits));
        System.out.println("The student was successfully added to the database");
    }

    void removeEnrollment() {
        System.out.print("Enter the Enrollment ID of the student to remove: ");
        String remid = sc.nextLine();
        boolean removed = false;
        Iterator<Student> it = stud.iterator();
        while (it.hasNext()) {
            Student s = it.next();
            if (s.getEnrollid().equals(remid)) {
                it.remove();
                removed = true;
                break;
            }
        }
        if (removed) {
            System.out.println("The student with enrollment ID " + remid + " was successfully removed");
        } else {
            System.out.println("No student found with enrollment ID " + remid);
        }
    }

    void updateCredits() {
        System.out.print("Enter the Enrollment ID of the student: ");
        String updcredits = sc.nextLine();
        System.out.print("Enter the new credits for the student: ");
        String newcredits = sc.nextLine();
        boolean updated = false;
        for (Student s : stud) {
            if (s.getEnrollid().equals(updcredits)) {
                s.setCredits(newcredits);
                updated = true;
                System.out.println("The student's credits with enrollment ID " + updcredits + " was successfully updated");
                break;
            }
        }
        if (!updated) {
            System.out.println("No student found with enrollment ID " + updcredits);
        }
    }

    void displayAll() {
        if (stud.isEmpty()) {
            System.out.println("There are no enrollments in the system");
        } else {
            for (Student s : stud) {
                s.displaystuds();
            }
        }
    }

    public static void main(String[] args) {
        Scanner sb = new Scanner(System.in);
        boolean running = true;
        Question1 studs = new Question1();
        int choice;
        while (running) {
            System.out.println();
            System.out.println("###############################################");
            System.out.println("Welcome to the Student Course Enrollment System");
            System.out.println("1: Add a new enrollment record");
            System.out.println("2: Remove an enrollment record");
            System.out.println("3: Update course credits for a student");
            System.out.println("4: Display all the enrolled student");
            System.out.println("5: Exit from the system");
            System.out.println("###############################################");
            System.out.println();
            System.out.print("Enter your choice(1-5): ");
            choice = sb.nextInt();
            sb.nextLine();
            switch (choice) {
                case 1:
                    studs.addEnrollment();
                    break;
                case 2:
                    studs.removeEnrollment();
                    break;
                case 3:
                    studs.updateCredits();
                    break;
                case 4:
                    studs.displayAll();
                    break;
                case 5:
                    System.out.println("Exiting the Student course Enrollment System");
                    running = false;
                    break;
                default:
                    System.out.println("Please enter a valid choice");
            }
        }
    }
}
