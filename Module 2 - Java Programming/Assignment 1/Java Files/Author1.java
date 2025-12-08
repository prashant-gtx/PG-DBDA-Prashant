class Author {
    String firstName;
    String lastName;
    
    public Author (String firstName, String lastName){
        this.firstName=firstName;
        this.lastName=lastName;
    }
    public void setFirstName (String firstName){
        this.firstName=firstName;
    }
    public void setLastName (String lastName){
        this.lastName=lastName;
    }
    public String getFirstName(){
        return firstName;
    }
    public String getlastName(){
        return lastName;
    }
    public String toString(){
        return "Author Name : "+ firstName + " " + lastName;
    }
}
public class Author1{
    public static void main(String[] args) {
        Author auth=new Author("Harshad","Mehta");

        auth.setFirstName("Raj");
        System.out.println(auth.getFirstName());

        auth.setLastName("Sharma");
        System.out.println(auth.getlastName());
    }
}