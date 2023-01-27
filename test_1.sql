
Q1:
create table tbl_stock(
    pk_int_stock_Id serial primary key,
    vchr_name VARCHAR(20),
    int_quantity int,
    int_price int);


Q2:
    alter table tbl_stock alter column int_price type float;

Q3:
    create table tbl_supplier(
        pk_int_supplier_id serial primary key,
        vchr_supplier_name VARCHAR(25)
    );

Q4: 
    alter table tbl_stock add fk_int_supplier int;

Q5:
    ALTER TABLE tbl_stock ADD CONSTRAINT fk_int_supplier FOREIGN KEY(fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id) ON DELETE CASCADE ON UPDATE CASCADE;

Q6:
    create table tbl_dept(
        pk_int_dept_id serial primary key,
        vchr_dept_name VARCHAR(25)
    );

Q7:
    create table tbl_classes(
        pk_int_class_id serial primary key,
        vchr_class_name varchar(20),
        fk_int_dept_id int
    );

Q8:
    create table tbl_enrollment(
        pk_int_enrollment_id serial primary key,
        int_count int,
        fk_int_class_id int,
        Foreign key (fk_int_class_id) references tbl_classes(pk_int_class_id) on delete cascade on update cascade
    );

Q9:
    ALTER TABLE tbl_classes Add CONSTRAINT tbl_classes_unq UNIQUE (vchr_class_name);

Q10:
    alter table tbl_dept add vchr_dept_description varchar(30);

Q11:
    INSERT INTO tbl_supplier(vchr_supplier_name) VALUES('Logitech'),('Samsung'),('Labell'),('LG'),('Creative');

 pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | Logitech
                  2 | Samsung
                  3 | Labell
                  4 | LG
                  5 | Creative