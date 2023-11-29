/*1.*/
create database if not exist SomeCompany;

/*2.*/
create table employees
(
employee_id INTEGER(11) auto_increment primary key,
first_name VARCHAR(25),
last_name VARCHAR(25),
birthdate DATE,
position VARCHAR(255),
department_id INT(11)
);


/*3.*/
create table departments
(
department_id INTEGER auto_increment primary key,
department_name VARCHAR(255),
department_head INT(11),
location VARCHAR(255)
)

/*4.*/
insert into employees (first_name, last_name, birthdate, position, department_id) values ('John', 'Doe', '1990-05-15', 'Software Engineer', 1);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Jane', 'Smith', '1985-08-20', 'Project Manager', 2);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Mike', 'Johnson', '1992-03-10', 'Data Analyst', 1);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Emily', 'Brown', '1988-12-03', 'UX Designer', 1);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Alex', 'Williams', '1995-06-28', 'Software Developer', 1);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Sarah', 'Miller', '1987-09-18', 'HR Specialist', 3);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Ethan', 'Clark', '1991-02-14', 'Database Administrator', 1);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Olivia', 'Garcia', '1984-07-22', 'Marketing Manager', 2);
insert into employees (first_name, last_name, birthdate, position, department_id) values ('Emilia', 'Clark', '1986-01-12', 'HR Manager', 3);

insert into departments (department_name, department_head, location) values ('IT', 11, 'Headquarters');
insert into departments (department_name, department_head, location) values ('Project Management', 2, 'Branch Office West');
insert into departments (department_name, department_head, location) values ('Human Resources', 6, 'Branch Office East');

/*5.*/
select last_name, position from employees;

/*6.*/
update employees set position = "Software Engineer" where employee_id = 5

/*7.*/
delete from employees where employee_id = 9

/*8.*/
select 
	first_name, 
	last_name,
	location,
	department_name
from 
	employees
natural join 
	departments 
	
	
/*9.*/
select
    e.last_name,
    d.department_name
from
    employees e
join
    departments d ON e.department_id = d.department_id
where
    case
        when d.department_name = 'IT' then 1
        when d.department_name = 'Management' then 2
        when d.department_name = 'Ressources Humaines' then 3
        else 4
    end <= 3;	

/*10.*/
SELECT
    d.department_name,
    e.last_name AS manager_name
FROM
    departments d
LEFT JOIN
    employees e ON d.department_head = e.employee_id
ORDER BY
    d.department_name;
   
/*11.*/
insert into departments (department_name, department_head, location) values ('Marketing', 11, 'Headquarters');
update employees set department_id = 4 where position like '%Marketing%';

/*12.*/
create table project
(
project_id INTEGER(11) auto_increment primary key,
project_name VARCHAR(255),
start_date DATE,
end_date DATE,
department_id INTEGER(11)
)

insert into project (project_name, start_date, end_date, department_id) values ('Project 1', NOW(), '2023-12-31', 1);
insert into project (project_name, start_date, end_date, department_id) values ('Project 2', NOW(), '2024-01-15', 1);
insert into project (project_name, start_date, end_date, department_id) values ('Project 3', NOW(), '2024-02-01', 1);
insert into project (project_name, start_date, end_date, department_id) values ('Project 4', NOW(), '2023-12-31', 2);
insert into project (project_name, start_date, end_date, department_id) values ('Project 5', NOW(), '2024-06-01', 2);
insert into project (project_name, start_date, end_date, department_id) values ('Project 6', NOW(), '2024-01-15', 2);
insert into project (project_name, start_date, end_date, department_id) values ('Project 7', NOW(), '2024-06-01', 2);
insert into project (project_name, start_date, end_date, department_id) values ('Project 8', NOW(), '2024-02-01', 2);
insert into project (project_name, start_date, end_date, department_id) values ('Project 9', NOW(), '2023-12-31', 3);
insert into project (project_name, start_date, end_date, department_id) values ('Project 10', NOW(), '2024-02-01', 3);
insert into project (project_name, start_date, end_date, department_id) values ('Project 11', NOW(), '2024-06-01', 3);
insert into project (project_name, start_date, end_date, department_id) values ('Project 12', NOW(), '2024-01-15', 3);
insert into project (project_name, start_date, end_date, department_id) values ('Project 13', NOW(), '2023-12-31', 4);
insert into project (project_name, start_date, end_date, department_id) values ('Project 14', NOW(), '2023-12-31', 4);
insert into project (project_name, start_date, end_date, department_id) values ('Project 15', NOW(), '2024-02-01', 4);
insert into project (project_name, start_date, end_date, department_id) values ('Project 16', NOW(), '2024-01-15', 4);
insert into project (project_name, start_date, end_date, department_id) values ('Project 17', NOW(), '2024-06-01', 4);

SELECT
    d.department_name,
    COUNT(*) AS nombre_de_projets
FROM
    project p
JOIN
    departments d ON p.department_id = d.department_id
WHERE
    p.department_id IN (1, 4)
GROUP BY
    p.department_id, d.department_name;




select count(*) from project 
