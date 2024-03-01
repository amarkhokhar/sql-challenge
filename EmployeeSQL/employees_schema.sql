--dropping the tables if they exist so tables are not re-created; do this before all
-- the create tables statements
-- cascade is used to drop dependencies on the tables
DROP TABLE IF EXISTS "titles" CASCADE;
DROP TABLE IF EXISTS "salary" CASCADE;
DROP TABLE IF EXISTS "employees" CASCADE;
DROP TABLE IF EXISTS "dept_manager" CASCADE;
DROP TABLE IF EXISTS "dept_emp" CASCADE;
DROP TABLE IF EXISTS "departments" CASCADE;

-- creating the titles tables, added primary key
CREATE TABLE "titles" (
    "title_id" VARCHAR (255)  NOT NULL,
    "title" VARCHAR (255)  NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--created the salary tables, added primary key
CREATE TABLE "salary" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_no"
     )
);

--created the employees table, added a composite key
CREATE TABLE "employees" (
    "emp_no" INT NOT NULL UNIQUE,
    "emp_title_id" VARCHAR (255)  NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR (255)  NOT NULL,
    "last_name" VARCHAR (255)  NOT NULL,
    "sex" VARCHAR (255)  NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no","emp_title_id"
     )
);

-- created a dept_manager table, added a composite key
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR (255)  NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

--added a dept_emp tables, addede a composite key
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR (255)  NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

--created a departments table, added a primary key
CREATE TABLE "departments" (
    "dept_no" VARCHAR (255)  NOT NULL,
    "dept_name" VARCHAR (255)  NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- altering all tables to add a foreign key
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salary" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
