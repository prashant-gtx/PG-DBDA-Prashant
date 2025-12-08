import java.util.*;
public class Movie {
	public static void main(String[]args) {
		System.out.println("Movie collection program");
		ArrayList<String> moviedb = new ArrayList<>();
		moviedb.add("Titanic");
		moviedb.add("Inception");
		moviedb.add("Lion King");
		moviedb.add("Reservoir Dogs");
		moviedb.add("Pulp Fiction");
		moviedb.add("Godfather");
		moviedb.add("Oppenheimer");
		moviedb.add("The Notebook");
		moviedb.add("Slumdog Millionare");
		moviedb.add("Dragon");
		moviedb.add("John Wick 1");
		moviedb.add("John Wick 2");
		moviedb.add("John Wick 3");
		moviedb.add("John Wick 4");
		moviedb.add("Ballerina");
		moviedb.add("12 Years a Slave");
		moviedb.add("Apocalypto");
		System.out.println("Movies are: " +moviedb);
		
		
		//Insert movie at first position
        moviedb.add(0, "The Matrix");
        System.out.println("After inserting at first: " + moviedb);
        
        // Retrieve element at specified index (index 2)
        String movieAtTwo = moviedb.get(2);
        System.out.println("Movie at index 2: " + movieAtTwo);
        
        //Update specific array elements by given element
        moviedb.set(2, "The Shawshank Redemption");
        System.out.println("Movie at after updating the 2 index: " + moviedb);
        
        //Remove the third element from an array list.
        moviedb.remove(2);
        System.out.println("Movie list after deleting the third element is: " +moviedb);
        
        // Search for an element in an array list
        if(moviedb.contains("Ballerina")) {
        	System.out.println("Movie list contains the movie");
        }
        else {
        	System.out.println("Movie list doesn't contains this movie");
        }
		
		//sort a given array list
        Collections.sort(moviedb);
        System.out.println("Movie list after sorting is: " +moviedb);
        
        //Reverse the array list
        Collections.reverse(moviedb);
        System.out.println("Movie list after reversing is: " +moviedb);
        
        //Empty the array list
        moviedb.clear();
        System.out.println("Movie list after clearing is: " +moviedb);
        
	}

}
