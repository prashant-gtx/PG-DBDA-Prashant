class Animal{
    void speak(){
        System.out.println("Animal Speak.....");
    }
}
class Dog extends Animal{
    void speak(){
        System.out.println("Dog Speak.....");
    }
}
class Cat extends Animal{
    void speak(){
        System.out.println("Cat Speak.....");
    }
}
public class AnimalsDetails{
    public static void main(String args[]){
        Dog d = new Dog();
        Cat c = new Cat();
        d.speak();
        c.speak();
    }
}