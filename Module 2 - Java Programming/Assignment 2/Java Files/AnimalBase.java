class Animal{
    void makeSound(){
        System.out.println("Sound");
    }
}

class Dog extends Animal{
    void makeSound(){
        System.out.println("Bark");
    }
}

public class AnimalBase{
    public static void main(String[] args) {
        Dog d =new Dog();
        d.makeSound();
    }
}