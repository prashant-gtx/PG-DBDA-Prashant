import java.util.ArrayList;
import java.util.Scanner;

// Book class
class Book {
    private String title;
    private String author;
    private String isbn;

    public Book(String title, String author, String isbn) {
        this.title = title;
        this.author = author;
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public String getIsbn() {
        return isbn;
    }

    public void displayBook() {
        System.out.println("Title: " + title + ", Author: " + author + ", ISBN: " + isbn);
    }
}

public class LibraryManagement {
    private static ArrayList<Book> library = new ArrayList<Book>();
    private static Scanner scanner = new Scanner(System.in);

    private static void addBook() {
        System.out.print("Enter title: ");
        String title = scanner.nextLine();
        System.out.print("Enter author: ");
        String author = scanner.nextLine();
        System.out.print("Enter ISBN: ");
        String isbn = scanner.nextLine();

        library.add(new Book(title, author, isbn));
        System.out.println("Book added successfully!\n");
    }

    private static void removeBook() {
        System.out.print("Enter ISBN of book to remove: ");
        String isbn = scanner.nextLine();

        boolean removed = false;
        for (int i = 0; i < library.size(); i++) {
            if (library.get(i).getIsbn().equals(isbn)) {
                library.remove(i);
                removed = true;
                break;
            }
        }

        if (removed) {
            System.out.println("Book removed successfully!\n");
        } else {
            System.out.println("Book not found!\n");
        }
    }

    private static void searchBook() {
        System.out.print("Enter title to search: ");
        String title = scanner.nextLine();

        boolean found = false;
        for (Book book : library) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                book.displayBook();
                found = true;
            }
        }
        if (!found) {
            System.out.println("No book found with that title!\n");
        }
    }

    private static void displayAllBooks() {
        if (library.isEmpty()) {
            System.out.println("No books in the library.\n");
        } else {
            System.out.println("Books in library:");
            for (Book book : library) {
                book.displayBook();
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        while (true) {
            System.out.println("=== Library Management System ===");
            System.out.println("1. Add Book");
            System.out.println("2. Remove Book");
            System.out.println("3. Search Book by Title");
            System.out.println("4. Display All Books");
            System.out.println("5. Exit");
            System.out.print("Choose an option: ");

            int choice;
            try {
                choice = Integer.parseInt(scanner.nextLine());
            } catch (Exception e) {
                System.out.println("Invalid input. Try again.\n");
                continue;
            }

            switch (choice) {
                case 1:
                    addBook();
                    break;
                case 2:
                    removeBook();
                    break;
                case 3:
                    searchBook();
                    break;
                case 4:
                    displayAllBooks();
                    break;
                case 5:
                    System.out.println("Exiting... Goodbye!");
                    return;
                default:
                    System.out.println("Invalid choice. Try again.\n");
            }
        }
    }
}
