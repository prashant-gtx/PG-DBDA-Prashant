import java.util.*;

class Employee2 {
    int id;
    String name;

    Employee2(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // Override toString() for readable output
    public String toString() {
        return "Employee2{id=" + id + ", name='" + name + "'}";
    }

    // Override equals and hashCode for proper HashSet behavior
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Employee2)) return false;
        Employee2 emp = (Employee2) o;
        return id == emp.id && Objects.equals(name, emp.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }
}

public class HashSetDemo {
    public static void main(String[] args) {
        // 1. Append the specified element to the end of a hash set for Employee2 Id and name
        HashSet<Employee2> Employee2Set = new HashSet<>();
        Employee2Set.add(new Employee2(101, "Prashant"));
        Employee2Set.add(new Employee2(102, "Amit"));
        Employee2Set.add(new Employee2(103, "Neha"));

        System.out.println("1. Initial HashSet:");
        for (Employee2 emp : Employee2Set) {
            System.out.println(emp);
        }

        // Append new Employee2 (addition)
        Employee2Set.add(new Employee2(104, "Sanjay"));
        System.out.println("\nAfter appending new Employee2:");
        for (Employee2 emp : Employee2Set) {
            System.out.println(emp);
        }

        // 2. Get the number of elements in a hash set
        System.out.println("\n2. Number of elements in the HashSet: " + Employee2Set.size());

        // 3. Convert hash set to an array
        Employee2[] Employee2Array = Employee2Set.toArray(new Employee2[0]);
        System.out.println("\n3. HashSet converted to array:");
        for (Employee2 emp : Employee2Array) {
            System.out.println(emp);
        }

        // 4. Convert hash set to a tree set (sort by Employee2 id)
        TreeSet<Employee2> Employee2TreeSet = new TreeSet<>(Comparator.comparingInt(e -> e.id));
        Employee2TreeSet.addAll(Employee2Set);
        System.out.println("\n4. HashSet converted to TreeSet (sorted by ID):");
        for (Employee2 emp : Employee2TreeSet) {
            System.out.println(emp);
        }

        // 5. Convert hash set to a List/ArrayList
        ArrayList<Employee2> Employee2List = new ArrayList<>(Employee2Set);
        System.out.println("\n5. HashSet converted to ArrayList:");
        for (Employee2 emp : Employee2List) {
            System.out.println(emp);
        }

        // 6. Remove all elements from a hash set
        Employee2Set.clear();
        System.out.println("\n6. All elements removed. HashSet empty? " + Employee2Set.isEmpty());
    }
}
