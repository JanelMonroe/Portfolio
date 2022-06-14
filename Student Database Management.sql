/*  Student Database Management for University of Maryland Global Campus */
-- creating tables, inserting values, generating a sequence, & creating a view -- 



-- Creating Tables

create table umgc (
umgc_id number(20) not null,
country varchar(30) not null,
opening_date date,
student_no number(30),
code number not null,
constraint umgc_pk primary key (umgc_id)
);


create table student (
student_id number(20) not null,
umgc_id number(20) not null,
name varchar(50) not null,
DOB date,
email varchar(30) not null,
state varchar(25) not null,
country varchar(25) not null, 
constraint student_pk primary key (student_id), 
constraint fk_umgc foreign key (umgc_id) references umgc (umgc_id)
);


create table course (
course_id number(20) not null,
student_id number(20) not null,
umgc_id number(20) not null,
course_name varchar(50) not null,
enrollment_date date,
term varchar(30) not null,
credits number(10),
constraint course_pk primary key (course_id),
constraint fk_student foreign key (student_id) references student (student_id),
constraint fk_umgcid foreign key (umgc_id) references umgc (umgc_id)
);


create table room (
room_id number(20) not null,
course_id number(20) not null,
room_type varchar(20),
date_time date,
seats number(5),
constraint room_pk primary key (room_id),
constraint fk_course foreign key(course_id) references course (course_id)
);


create table mbs_direct (
mbs_id number(20) not null,
course_id number(20) not null,
student_id number(20) not null,
books varchar(150),
materials varchar(20),
new_or_used_books varchar(15),
dat date,
book_price number(15),
material_price number(15),
constraint mbs_pk primary key (mbs_id),
constraint fk_courseid foreign key(course_id) references course (course_id),
constraint fk_studentid foreign key(student_id) references student(student_id)
);



-- Inserting Values into the Tables

insert all
into umgc (umgc_id, country, opening_date, code) values (100, 'Germany', to_date('1996/08/01', 'yyyy/mm/dd'), 3795)
into umgc (umgc_id, country, opening_date, code) values (101, 'Egypt', to_date('2000/06/01', 'yyyy/mm/dd'), 3645)
into umgc (umgc_id, country, opening_date, code) values (102, 'United States', to_date('1990/01/30', 'yyyy/mm/dd'), 3275)
into umgc (umgc_id, country, opening_date, code) values (103, 'Greece', to_date('1992/07/01', 'yyyy/mm/dd'), 3456)
into umgc (umgc_id, country, opening_date, code) values (104, 'Kuwait', to_date('2009/03/01', 'yyyy/mm/dd'), 3891)
into umgc (umgc_id, country, opening_date, code) values (105, 'Portugal', to_date('2002/05/01', 'yyyy/mm/dd'), 3915)
into umgc (umgc_id, country, opening_date, code) values (106, 'Spain', to_date('1999/06/01', 'yyyy/mm/dd'), 3388)
into umgc (umgc_id, country, opening_date, code) values (107, 'United Kingdom', to_date('1993/01/01', 'yyyy/mm/dd'), 3169)
into umgc (umgc_id, country, opening_date, code) values (108, 'Turkey', to_date('2003/12/01', 'yyyy/mm/dd'), 3520)
select * from dual;


insert all
into student (student_id, umgc_id, name, dob, email, state) values (1001, 107, 'Jan Levinson', to_date('1982/11/18', 'yyyy/mm/dd'), 'jlevinson@yahoo.com', 'Belfast')
into student (student_id, umgc_id, name, dob, email, state) values (1002, 106, 'Tara Gaskins', to_date('1991/1/26', 'yyyy/mm/dd'), 'tgaskins@gmail.com', 'Barcelona')
into student (student_id, umgc_id, name, dob, email, state) values (1003, 102, 'Sara Wells', to_date('2000/07/15', 'yyyy/mm/dd'), 'swells@yahoo.com', 'Maryland')
into student (student_id, umgc_id, name, dob, email, state) values (1004, 108, 'Brandon Thomas', to_date('1996/12/23', 'yyyy/mm/dd'), 'bthomas@gmail.com', 'Aydin')
into student (student_id, umgc_id, name, dob, email, state) values (1005, 103, 'Kelley Moore', to_date('1982/03/26', 'yyyy/mm/dd'), 'k.moore@yahoo.com', 'Athens')
into student (student_id, umgc_id, name, dob, email, state) values (1006, 101, 'Peter Thomas', to_date('1990/09/20', 'yyyy/mm/dd'), 'pthomas@gmail.com', 'Cairo')
into student (student_id, umgc_id, name, dob, email, state) values (1007, 104, 'Tom Brady', to_date('1971/04/12', 'yyyy/mm/dd'), 't.brady@yahoo.com', 'Al Ahmadi')
into student (student_id, umgc_id, name, dob, email, state) values (1008, 105, 'Ann Smith', to_date('1992/05/03', 'yyyy/mm/dd'), 'a.smith@yahoo.com', 'Beira')
into student (student_id, umgc_id, name, dob, email, state) values (1009, 100, 'Scott Parker', to_date('1989/12/15', 'yyyy/mm/dd'), 'sparker@gmail.com', 'Hessen')
into student (student_id, umgc_id, name, dob, email, state) values (1010, 102, 'Troy Cooper', to_date('1985/08/19', 'yyyy/mm/dd'), 't.cooper@yahoo.com', 'Texas')
into student (student_id, umgc_id, name, dob, email, state) values (1011, 102, 'Brittany Anderson', to_date('1996/03/26', 'yyyy/mm/dd'), 'b.anderson@gmail.com', 'California')
into student (student_id, umgc_id, name, dob, email, state) values (1012, 102, 'Kayla Pratt', to_date('1993/07/14', 'yyyy/mm/dd'), 'k.pratt@yahoo.com', 'Florida')
into student (student_id, umgc_id, name, dob, email, state) values (1013, 102, 'Ben Barker', to_date('1972/09/11', 'yyyy/mm/dd'), 'b.barker@gmail.com', 'Virginia')
into student (student_id, umgc_id, name, dob, email, state) values (1014, 102, 'Michael Johnson', to_date('1970/06/09', 'yyyy/mm/dd'), 'm.johnson@yahoo.com', 'Pennsylvania')
into student (student_id, umgc_id, name, dob, email, state) values (1015, 102, 'Karla Jenkins', to_date('1995/02/24', 'yyyy/mm/dd'), 'k.jenkins@gmail.com', 'Colorado')
into student (student_id, umgc_id, name, dob, email, state) values (1016, 102, 'Janet Hilson', to_date('1994/07/16', 'yyyy/mm/dd'), 'j.hilson@yahoo.com', 'Maryland')
into student (student_id, umgc_id, name, dob, email, state) values (1017, 102, 'Randy Smith', to_date('2000/06/06', 'yyyy/mm/dd'), 'r.smith@gmail.com', 'Maryland')
into student (student_id, umgc_id, name, dob, email, state) values (1018, 102, 'Bob Miller', to_date('1974/11/19', 'yyyy/mm/dd'), 'b.miller@gmail.com', 'Maryland')
into student (student_id, umgc_id, name, dob, email, state) values (1019, 102, 'Ciara Campbell', to_date('1987/05/10', 'yyyy/mm/dd'), 'c.campbell@gmail.com', 'Maryland')
into student (student_id, umgc_id, name, dob, email, state) values (1020, 102, 'Liz Harper', to_date('2000/08/22', 'yyyy/mm/dd'), 'l.harper@yahoo.com', 'New York')
select * from dual;


insert all
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2908, 1020, 102, 'Biology', to_date('2022/06/06', 'yyyy/mm/dd'), 'summer', 4)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2959, 1019, 102, 'English', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2971, 1018, 102, 'Chemistry', to_date('2021/09/10', 'yyyy/mm/dd'), 'fall', 4)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2945, 1017, 102, 'Economics', to_date('2022/06/06', 'yyyy/mm/dd'), 'summer', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2991, 1016, 102, 'Finance', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2935, 1015, 102, 'Geology', to_date('2022/09/05', 'yyyy/mm/dd'), 'fall', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2920, 1014, 102, 'Humanities', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2988, 1013, 102, 'Marketing', to_date('2022/06/06', 'yyyy/mm/dd'), 'summer', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2972, 1012, 102, 'Nutrition', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2924, 1011, 102, 'Sociology', to_date('2022/09/05', 'yyyy/mm/dd'), 'fall', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2999, 1010, 102, 'Speech', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2946, 1009, 100, 'Fundamentals of Networking', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2961, 1008, 105, 'Music', to_date('2022/09/05', 'yyyy/mm/dd'), 'fall', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2903, 1007, 104, 'Journalism', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2928, 1006, 101, 'History', to_date('2022/06/06', 'yyyy/mm/dd'), 'summer', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2911, 1005, 103, 'Introduction to Linux', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2976, 1004, 108, 'Astronomy', to_date('2022/06/06', 'yyyy/mm/dd'), 'summer', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2950, 1003, 102, 'Business Management', to_date('2022/09/05', 'yyyy/mm/dd'), 'fall', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2937, 1002, 106, 'Art', to_date('2022/01/03', 'yyyy/mm/dd'), 'spring', 3)
into course (course_id, student_id, umgc_id, course_name, enrollment_date, term, credits) values (2963, 1001, 107, 'Calculus', to_date('2022/09/05', 'yyyy/mm/dd'), 'spring', 3)
select * from dual;


insert all 
into room (room_id, course_id, room_type, date_time, seats) values (301, 2963, 'online', to_date('2022/09/05', 'yyyy/mm/dd'), 29)
into room (room_id, course_id, room_type, date_time, seats) values (348, 2937, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (312, 2950, 'hybrid', to_timestamp('2022/09/05 08:00:00', 'yyyy/mm/dd hh:mi:ss'), 32)
into room (room_id, course_id, room_type, date_time, seats) values (399, 2976, 'online', to_date('2022/06/06', 'yyyy/mm/dd'), 27)
into room (room_id, course_id, room_type, date_time, seats) values (383, 2911, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (356, 2928, 'online', to_date('2022/06/06', 'yyyy/mm/dd'), 31)
into room (room_id, course_id, room_type, date_time, seats) values (374, 2903, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (319, 2961, 'online', to_date('2022/09/05', 'yyyy/mm/dd'), 29)
into room (room_id, course_id, room_type, date_time, seats) values (327, 2946, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 32)
into room (room_id, course_id, room_type, date_time, seats) values (371, 2999, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 27)
into room (room_id, course_id, room_type, date_time, seats) values (360, 2924, 'online', to_date('2022/09/05', 'yyyy/mm/dd'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (333, 2972, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 29)
into room (room_id, course_id, room_type, date_time, seats) values (395, 2988, 'online', to_date('2022/06/06', 'yyyy/mm/dd'), 31)
into room (room_id, course_id, room_type, date_time, seats) values (343, 2920, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (377, 2935, 'online', to_date('2022/09/05', 'yyyy/mm/dd'), 28)
into room (room_id, course_id, room_type, date_time, seats) values (364, 2991, 'hybrid', to_timestamp('2022/01/03 09:00:00', 'yyyy/mm/dd hh:mi:ss'), 31)
into room (room_id, course_id, room_type, date_time, seats) values (318, 2945, 'hybrid', to_timestamp('2022/06/06 08:30:00', 'yyyy/mm/dd hh:mi:ss'), 29)
into room (room_id, course_id, room_type, date_time, seats) values (309, 2971, 'hybrid', to_timestamp('2022/09/10 08:00:00', 'yyyy/mm/dd hh:mi:ss'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (393, 2959, 'online', to_date('2022/01/03', 'yyyy/mm/dd'), 30)
into room (room_id, course_id, room_type, date_time, seats) values (311, 2908, 'online', to_date('2022/06/06', 'yyyy/mm/dd'), 28)
select * from dual;


insert all
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (1, 2908, 1020, 'Essential Cell Biology', 'Lab', 'new', to_date('2022/05/06', 'yyyy/mm/dd'), 200, 250)
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (2, 2945, 1017, 'Economic Development', '', 'used', to_date('2022/05/20', 'yyyy/mm/dd'), 100, '')
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (3, 2991, 1016, 'Foundations of Finance', '', 'new', to_date('2022/01/01', 'yyyy/mm/dd'), 220, '')
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (4, 2920, 1014, 'Business and Humanities', '', 'new', to_date('2021/12/30', 'yyyy/mm/dd'), 150, '')
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (5, 2972, 1012, 'Understanding Nutrition', '', 'used', to_date('2022/01/02', 'yyyy/mm/dd'), 60, '')
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (6, 2946, 1009, 'Computer Networking', 'Lab', 'new', to_date('2022/01/03', 'yyyy/mm/dd'), 200, 400)
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (7, 2928, 1006, 'World History', '', 'used', to_date('2022/05/15', 'yyyy/mm/dd'), 80, '')
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (8, 2911, 1005, 'Guide to Linux', 'Lab', 'new', to_date('2022/12/28', 'yyyy/mm/dd'), 300, 200)
into mbs_direct (mbs_id, course_id, student_id, books, materials, new_or_used_books, dat, book_price, material_price) values (9, 2976, 1004, 'Pathways to Astronomy', '', 'used', to_date('2022/05/10', 'yyyy/mm/dd'), 200, '')
select * from dual;


-- Creating a Sequence for MBS Direct Table

create sequence mbs_direct_seq
minvalue 1
maxvalue 999999999999999999999999999999
start with 10
increment by 1
cache 20;



-- Creating a Student Order View

create view student_orders as
select student.student_id, student.name, mbs_direct.books, mbs_direct.materials, mbs_direct.new_or_used_books, mbs_direct.dat, mbs_direct.book_price, mbs_direct.material_price
from student
inner join mbs_direct
on student.student_id = mbs_direct.student_id;


select * from student_orders

 