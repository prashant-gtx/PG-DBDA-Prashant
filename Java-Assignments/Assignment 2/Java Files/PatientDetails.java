class Patient{
    private int id;
    private String name;
    private String disease;

    void setValue(int id,String name,String disease){
        this.id=id;
        this.name=name;
        this.disease=disease;
    }
    String getValue(){
        return id+" "+name+" "+disease ;
    }
}
public class PatientDetails{
    public static void main(String[] args) {
        Patient p = new Patient();
        p.setValue(45,"Alice","xyz");
        System.out.println("Id and Name and Disease : "+p.getValue());
    }
}