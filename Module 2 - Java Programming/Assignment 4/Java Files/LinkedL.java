import java.util.*;

public class LinkedL {

	public static void main(String[] args) {
		System.out.println("Linked list program");
		LinkedList<String> LL = new LinkedList<>();
		LL.add("Prashant");
		LL.add("Amit");
		LL.add("Neha");
		LL.add("Sanjay");
		LL.add("Ritika");
		LL.add("Anjali");
		LL.add("Vikram");
		LL.add("Karan");
		LL.add("Meena");
		LL.add("Rohit");
		LL.add("Divya");
		LL.add("Arjun");
		LL.add("Pooja");
		LL.add("Rahul");
		LL.add("Sneha");
		LL.add("Nikhil");
		
		//append the specified element to the end of a linked list of names.
		System.out.println("1. Append to the end of a linked list of names.");
		LL.add("Archi");
		System.out.println(LL);
		System.out.println();
		
		// Iterate through all elements in a linked list starting at the specified position.
		System.out.println("Iterate through all the elements in the linked list starting at the specified position");
		
		for(int i=3; i<LL.size();i++) {          //Index specified is 3 which is the start position to iterate
			System.out.println(LL.get(i));
		}
		
		// Iterate a linked list in reverse order.
		
        System.out.println("1. Linked list in reverse order:");
        for (int i = LL.size() - 1; i >= 0; i--) {
            System.out.println(LL.get(i));
        }

        // Insert the specified element at the specified position
        int insertPos = 2;
        String elementToInsert = "Karan";
        LL.add(insertPos, elementToInsert);
        System.out.println("\n2. After inserting '" + elementToInsert + "' at position " + insertPos + ":");
        System.out.println(LL);

        // Insert elements at the first and last position
        LL.addFirst("Divya");
        LL.addLast("Rohit");
        System.out.println("\n3. After adding elements at first and last positions:");
        System.out.println(LL);

        // Insert the specified element at the front of the linked list
        String frontElement = "Pooja";
        LL.addFirst(frontElement);
        System.out.println("\n4. After inserting '" + frontElement + "' at the front:");
        System.out.println(LL);

        // Insert some elements at the specified position
        int multipleInsertPos = 4;
        String[] multipleElements = {"Arjun", "Sneha"};
        for (int i = 0; i < multipleElements.length; i++) {
            LL.add(multipleInsertPos + i, multipleElements[i]);
        }
        System.out.println("\n5. After inserting multiple elements at position " + multipleInsertPos + ":");
        System.out.println(LL);

        // Get the first and last occurrence of the specified element
        String searchElement = "Neha";
        int firstOccurrence = LL.indexOf(searchElement);
        int lastOccurrence = LL.lastIndexOf(searchElement);
        System.out.println("\n6. First occurrence of '" + searchElement + "': " + firstOccurrence);
        System.out.println("   Last occurrence of '" + searchElement + "': " + lastOccurrence);

        // Remove the first and last element from the linked list
        String removedFirst = LL.removeFirst();
        String removedLast = LL.removeLast();
        System.out.println("\n7. After removing first element '" + removedFirst + "' and last element '" + removedLast + "':");
        System.out.println(LL);
        
        // 8. Swap two elements in the linked list
        int index1 = 1, index2 = 4; // example indices to swap
        String temp = LL.get(index1);
        LL.set(index1, LL.get(index2));
        LL.set(index2, temp);
        System.out.println("\n8. After swapping elements at positions " + index1 + " and " + index2 + ":");
        System.out.println(LL);

        // 9. Join two linked lists
        LinkedList<String> secondList = new LinkedList<>();
        secondList.add("Rahul");
        secondList.add("Anu");
        secondList.add("Vivek");
        LinkedList<String> joinedList = new LinkedList<>(LL);
        joinedList.addAll(secondList);
        System.out.println("\n9. Joined linked list:");
        System.out.println(joinedList);

        // 10. Check if a particular element exists
        String elementToCheck = "Sneha";
        boolean exists = joinedList.contains(elementToCheck);
        System.out.println("\n10. Does the element '" + elementToCheck + "' exist? " + exists);

        // 11. Convert the linked list to an ArrayList
        ArrayList<String> arrayList = new ArrayList<>(joinedList);
        System.out.println("\n11. Converted ArrayList:");
        System.out.println(arrayList);

        // 12. Compare two linked lists
        LinkedList<String> compareList = new LinkedList<>();
        compareList.addAll(LL); // copy LL's elements
        boolean areEqual = LL.equals(compareList);
        System.out.println("\n12. Are LL and compareList equal? " + areEqual);

        // 13. Test whether a linked list is empty or not
        LinkedList<String> emptyList = new LinkedList<>();
        System.out.println("\n13. Is emptyList empty? " + emptyList.isEmpty());
        System.out.println("    Is LL empty? " + LL.isEmpty());

        // 14. Replace an element in the linked list
        int replaceIndex = 3;
        String newElement = "Ananya";
        LL.set(replaceIndex, newElement);
        System.out.println("\n14. After replacing element at index " + replaceIndex + " with '" + newElement + "':");
        System.out.println(LL);
    }


	}


