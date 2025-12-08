class Book{
    String title;
    String author;
    double price;

    public Book (String title, String author, double price){
        this.title=title;
        this.author=author;
        this.price=price;
    }

    public void setTitle(String title){
        this.title=title;
    }

    public void setAuthor(String author){
        this.author=author;
    }
    public void setPrice(double price){
        this.price=price;
    }
    public String getTitle(){
        return title;
    }
    public String getAuthor(){
        return author;
    }
    public String toString(){
        return "Title : "+title +" | Author : "+author+" | Price : "+price;
    }
}

public class BookDemo{
    public static void main(String[] args) {
        Book book = new Book("Developing Java Software", "Russel Winder", 79.75);

        System.out.println(book);
    }
}
