//package Exam;
import java.util.*;

class Student1 {
    String enrollid;
    String studentname;
    String coursename;
    int credits;

    Student1(String enrollid, String studentname, String coursename, int credits) {
        this.enrollid = enrollid;
        this.studentname = studentname;
        this.coursename = coursename;
        this.credits = credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getEnrollid() {
        return enrollid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void displaystuds() {
        System.out.println("Enrollment ID:" + enrollid + " | Student name:" + studentname +
                " | Course name:" + coursename + " | Credits:" + credits);
    }
}

public class Question2 {
    ArrayList<Student1> stud = new ArrayList<Student1>();
    Scanner sc = new Scanner(System.in);

    void addEnrollment() {
        try {
            System.out.println("Adding a new student to the system");
            System.out.print("Enter the Enrollment ID of the student: ");
            String enrollid = sc.nextLine();
            System.out.print("Enter the name of the student: ");
            String studentname = sc.nextLine();
            System.out.print("Enter the course of the student: ");
            String coursename = sc.nextLine();
            System.out.print("Enter the credits for the student (positive number): ");
            int credits = sc.nextInt();
            sc.nextLine(); // consume newline

            // Validation
            if (credits <= 0) {
                throw new IllegalArgumentException("Credits must be positive.");
            }

            // Check duplicate
            for (Student1 s : stud) {
                if (s.getEnrollid().equals(enrollid) && s.getCoursename().equalsIgnoreCase(coursename)) {
                    throw new IllegalArgumentException("Duplicate enrollment for same student and course.");
                }
            }

            stud.add(new Student1(enrollid, studentname, coursename, credits));
            System.out.println("The student was successfully added to the database");

        } catch (InputMismatchException e) {
            System.out.println("Invalid input type! Credits must be a number.");
            sc.nextLine(); // clear invalid input
        } catch (IllegalArgumentException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    void removeEnrollment() {
        try {
            System.out.print("Enter the index of the student to remove (0-based): ");
            int index = sc.nextInt();
            sc.nextLine(); // consume newline

            Student1 removed = stud.remove(index);
            System.out.println("The student with enrollment ID " + removed.getEnrollid() + " was successfully removed");

        } catch (InputMismatchException e) {
            System.out.println("Invalid input type! Please enter a number.");
            sc.nextLine(); // clear invalid input
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Invalid index! No student found at this position.");
        }
    }

    void updateCredits() {
        try {
            System.out.print("Enter the Enrollment ID of the student: ");
            String updId = sc.nextLine();
            System.out.print("Enter the new credits for the student: ");
            int newcredits = sc.nextInt();
            sc.nextLine(); // consume newline

            if (newcredits <= 0) {
                throw new IllegalArgumentException("Credits must be positive.");
            }

            boolean updated = false;
            for (Student1 s : stud) {
                if (s.getEnrollid().equals(updId)) {
                    s.setCredits(newcredits);
                    updated = true;
                    System.out.println("The student's credits with enrollment ID " + updId + " was successfully updated");
                    break;
                }
            }
            if (!updated) {
                System.out.println("No student found with enrollment ID " + updId);
            }

        } catch (InputMismatchException e) {
            System.out.println("Invalid input type! Credits must be a number.");
            sc.nextLine(); // clear invalid input
        } catch (IllegalArgumentException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    void displayAll() {
        if (stud.isEmpty()) {
            System.out.println("There are no enrollments in the system");
        } else {
            for (Student1 s : stud) {
                s.displaystuds();
            }
        }
    }

    public static void main(String[] args) {
        Scanner sb = new Scanner(System.in);
        boolean running = true;
        Question2 studs = new Question2();
        int choice;
        while (running) {
            System.out.println();
            System.out.println("###############################################");
            System.out.println("Welcome to the Student Course Enrollment System");
            System.out.println("1: Add a new enrollment record");
            System.out.println("2: Remove an enrollment record by index");
            System.out.println("3: Update course credits for a student");
            System.out.println("4: Display all the enrolled students");
            System.out.println("5: Exit from the system");
            System.out.println("###############################################");
            System.out.println();
            System.out.print("Enter your choice(1-5): ");
            try {
                choice = sb.nextInt();
                sb.nextLine(); // consume newline
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
            } catch (InputMismatchException e) {
                System.out.println("Invalid choice! Please enter a number between 1-5.");
                sb.nextLine(); 
            }
        }
    }
}
