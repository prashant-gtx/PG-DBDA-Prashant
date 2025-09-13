import java.util.ArrayList;
import java.util.Scanner;

class Patient{
    String patientId;
    String name;
    String diagnosis;
    int admitDay;

    Patient(String patientId,String name,String diagnosis,int admitDay){
        this.patientId=patientId;
        this.name=name;
        this.diagnosis=diagnosis;
        this.admitDay=admitDay;
    }

    void setpatientId(String patientId){
        this.patientId=patientId;
    }
    void setname(String name){
        this.name=name;
    }
    void setdiagnosis(String diagnosis){
        this.diagnosis=diagnosis;
    }
    void setadmitDay(int admitDay){
        this.admitDay=admitDay;
    }

    String getpatientId(){
        return patientId;
    }
    String getname(){
        return name;
    }
    String getdiagnosis(){
        return diagnosis;
    }
    int getadmitDay(){
        return admitDay;
    }

    void Display(){
        System.out.println("Patient Id : "+patientId+" Name : "+name+" Diagnosis : "+diagnosis+" Admited Days : "+admitDay);
    }
}

public class PatientManagement{
    ArrayList<Patient> patient;

    public PatientManagement(){
        patient = new ArrayList<>();
    }

    void addPatient(Patient p){
        patient.add(p);
    }

    void removePatient(String pid){
        boolean remove = patient.removeIf(patient -> patient.getpatientId().equals(pid));
        if (remove){
            System.out.println("Patient Remove Successfully....");
        }
        else{
            System.out.println("Patient Not Found....");
        }
    }

    void searchDiagonsis(String diagnosis){
        for(Patient patient:patient){
            if(patient.getdiagnosis().equals(diagnosis)){
                patient.Display();
            }
        }
    }

    void daysAdmitted(){
        for(Patient patient:patient){
            if(5 < patient.getadmitDay()){
                patient.Display();
            }
        }
    }

    void displayAll(){
        if(patient.isEmpty()){
            System.out.println("No Patient Admitted......");
        }
        else{
            for(Patient patient : patient){
                patient.Display();
            }
        }
    }

    public static void main(String args[]){

        PatientManagement pm =new PatientManagement();
        Scanner scanner = new Scanner(System.in);

        while(true){
        System.out.println("1. Add Patient Details ");
        System.out.println("2. Remove Patient Details ");
        System.out.println("3. Find all patients with a specific diagnosis ");
        System.out.println("4. Find all patients admitted for more than a 5 days ");
        System.out.println("5. Display all Patient ");
        System.out.println("6. Exit");
        System.out.print("Enter your choice : ");
        int choice = scanner.nextInt();
        scanner.nextLine();

        switch(choice){
            case 1:
                System.out.print("Enter Patient Id : ");
                String id= scanner.nextLine();
                System.out.print("Enter Patient Name : ");
                String name=scanner.nextLine();
                System.out.print("Enter Patient Diagonsis : ");
                String dia=scanner.nextLine();
                System.out.print("Enter Number of days Admitted : ");
                int day=scanner.nextInt();
                scanner.nextLine();
                Patient patient=new Patient(id,name,dia,day);
                pm.addPatient(patient);
                break;
            case 2:
                System.out.print("Enter Patient Id to remove : ");
                String rid= scanner.nextLine();
                pm.removePatient(rid);
            case 3:
                System.out.print("Search Patient with special Diagonsis : ");
                String pdia=scanner.nextLine();
                pm.searchDiagonsis(pdia);
                break;
            case 4:
                System.out.println("Number of Patient admitted more than 5 : ");
                pm.daysAdmitted();
                break;
            case 5:
                System.out.println("Displaying all patient....");
                pm.displayAll();
                break;
            case 6:
                System.out.println("Exit from Patient Management System .....");
                System.exit(0);
            default:
                System.out.print("Enter valid choice : ");
        }
    }
    }
}