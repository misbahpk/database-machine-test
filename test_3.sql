Q1:

        insert into tbl_stock values(4,'memory',100,1501.5,5);

    SELECT SUM(int_quantity*int_price) as totalcost from tbl_stock;

 totalcost
-----------
  214015.5
(1 row)

Q2:
    
     select sum(int_quantity) as total_no_product from tbl_stock;
 total_no_product
------------------
              177

Q3:

    select upper(vchr_name)as product_name,round(int_price)as product_price from tbl_stock; 

 product_name | product_price
--------------+---------------
 MOUSE        |           502
 KEYBOARD     |           452
 MODEM        |          1202
 HEADPHONE    |           752
 MEMORY       |          3502
 MEMORY       |          1502

Q4:
    
     SELECT COUNT(DISTINCT vchr_name) AS items FROM tbl_stock;

 items
-------
     5

Q5:
     select vchr_name,int_price from tbl_stock where int_price = (select MAX(int_price) from tbl_stock);

 vchr_name | int_price
-----------+-----------
 Memory    |    3501.5


Q6:
    insert into tbl_enrollment(int_count,fk_int_class_id) values(40,1),(15,2),(10,3),(12,4),(60,2),(14,6),(200,7);

     pk_int_enrollment_id | int_count | fk_int_class_id
    ----------------------+-----------+-----------------
                        1 |        40 |               1
                        2 |        15 |               2
                        3 |        10 |               3
                        4 |        12 |               4
                        5 |        60 |               2
                        6 |        14 |               6
                        7 |       200 |               7

    select sum(int_count) as total_enrollment from tbl_enrollment;

    total_enrollment
    ------------------
            351


 Q7:
    insert into tbl_classes(vchr_class_name,fk_int_dept_id) values('CS100',1),('CS101',1),('CS102',1),('CS103',1),('EC200',2),('CC300',3),('CS400',4);
      pk_int_class_id | vchr_class_name | fk_int_dept_id
     -----------------+-----------------+----------------
                    1 | CS100           |              1
                    2 | CS101           |              1
                    3 | CS102           |              1
                    4 | CS103           |              1
                    5 | EC200           |              2
                    6 | CC300           |              3
                    7 | CS400           |              4

   SELECT count(distinct vchr_class_name) as no_of_classes FROM tbl_classes;

 no_of_classes
---------------
             7

Q8:
    delete from tbl_stock where fk_int_supplier = 5;

     pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
    -----------------+-----------+--------------+-----------+-----------------
                   1 | Mouse     |           10 |     501.5 |               1
                   2 | Keyboard  |            5 |     451.5 |               3
                   3 | Modem     |           10 |    1201.5 |               2
                   5 | Headphone |           50 |     751.5 |               4
                   6 | Memory    |            2 |    3501.5 |               4
    
Q9:
    select concat(vchr_name,int_price) as product_price from tbl_stock;

 product_price
----------------
 Mouse501.5
 Keyboard451.5
 Modem1201.5
 Headphone751.5
 Memory3501.5

Q10:
    create table Tbl_student(
        enrl_no int primary key,
        roll_no int,
        name varchar(20),
        city varchar(30),
        mobile bigint,
        dob date
    );

    insert into Tbl_student values(11,2,'Akhil','Delhi',98756579,'01-12-1986'),(6,4,'Maya','Banglore',98734534,'11-12-1987'),(1,8,'Anoop','Banglore',93456535,'12-22-1990'),(20,1,'Paul','Cochin',96754555,'03-13-1991'),(3,5,'Sandeep','Delhi',84865644,'06-14-1993');

 enrl_no | roll_no |  name   |   city   |  mobile  |    dob
---------+---------+---------+----------+----------+------------
      11 |       2 | Akhil   | Delhi    | 98756579 | 1986-01-12
       6 |       4 | Maya    | Banglore | 98734534 | 1987-11-12
       1 |       8 | Anoop   | Banglore | 93456535 | 1990-12-22
      20 |       1 | Paul    | Cochin   | 96754555 | 1991-03-13
       3 |       5 | Sandeep | Delhi    | 84865644 | 1993-06-14

    create table tbl_grade(roll_no int,course varchar(25),grade varchar(20));

    insert into tbl_grade values(2,'C','A'),(2,'Java','B'),(1,'C','B'),(1,'Java','A'),(4,'PHP','A'),(4,'Java','A'),(4,'C','B'),(8,'Java','B'),(5,'PHP','A'),(5,'Java','D');

 roll_no | course | grade
---------+--------+-------
       2 | C      | A
       2 | Java   | B
       1 | C      | B
       1 | Java   | A
       4 | PHP    | A
       4 | Java   | A
       4 | C      | B
       8 | Java   | B
       5 | PHP    | A
       5 | Java   | D

   select name,course,grade from Tbl_student inner join tbl_grade on Tbl_student.roll_no=tbl_grade.roll_no where grade = 'A';
 
      name   | course | grade
    ---------+--------+-------
     Akhil   | C      | A
     Maya    | Java   | A
     Maya    | PHP    | A
     Paul    | Java   | A
     Sandeep | PHP    | A
Q11:

     select count(name) as no_of_std,grade from Tbl_student inner join tbl_grade on Tbl_student.roll_no=tbl_grade.roll_no group by grade having grade= 'B';

      no_of_std | grade
     -----------+-------
              4 | B

Q12:
    
    select max(Tbl_Student.roll_no) as roll_no,name,count(course) as number_of_course FROM (Tbl_Student  INNER JOIN tbl_grade ON Tbl_Student.roll_no = tbl_grade.roll_no) group by name;


     roll_no |  name   | number_of_course
    ---------+---------+------------------
           2 | Akhil   |                2
           8 | Anoop   |                1
           1 | Paul    |                2
           5 | Sandeep |                2
           4 | Maya    |                3

Q13:

    select name,course,city from Tbl_student inner join tbl_grade on Tbl_student.roll_no = tbl_grade.roll_no where city = 'Banglore' and course = 'Java';

     name  | course |   city
    -------+--------+----------
     Maya  | Java   | Banglore
     Anoop | Java   | Banglore

Q14:

    select course,name from Tbl_student inner join tbl_grade on tbl_grade.roll_no = Tbl_Student.roll_no where name like 'A%' ;

     course | name
    --------+-------
     C      | Akhil
     Java   | Akhil
     Java   | Anoop

Q15:

    SELECT name, date_part('year',age(dob)) as age FROM Tbl_Student;

      name   | age
    ---------+-----
     Akhil   |  37
     Maya    |  35
     Anoop   |  32
     Paul    |  31
     Sandeep |  29

Q16:

    select name,to_char(dob,'dd-Mon-yyyy') from Tbl_student;

      name   |   to_char
    ---------+-------------
     Akhil   | 12-Jan-1986
     Maya    | 12-Nov-1987
     Anoop   | 22-Dec-1990
     Paul    | 13-Mar-1991
     Sandeep | 14-Jun-1993