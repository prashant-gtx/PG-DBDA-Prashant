use cdac;

Create table Student(
	StudentID int Primary Key NOT NULL,
	StudentName varchar(25),
	CourseName varchar(15),
	Age Int);

CREATE TABLE Hostel (
    StudentID INT NOT NULL,
    StudentName VARCHAR(25),
    RoomNo VARCHAR(15),
    FoodOption VARCHAR(15),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

select * from Student;
INSERT INTO Student VALUES
    (1, 'Prashant', 'DBDA', 21),
    (2, 'Prapti', 'DBDA', 22),
    (3, 'Neha', 'DBDA', 22),
    (4, 'Deependra', 'DBDA', 22);

INSERT INTO Hostel VALUES
	(1, 'Prashant', 101, "Non Veg"),
    (2, 'Prapti', 102, "Veg"),
    (3, 'Neha', 102, "Non Veg"),
    (4, 'Deependra', 101, "Veg");

SELECT * FROM Hostel;
