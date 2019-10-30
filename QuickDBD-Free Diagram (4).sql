-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bRnTBC
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "ID" INTEGER   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "dept_employees" (
    "Employee_ID" INTEGER   NOT NULL,
    "Dept_ID" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Managers" (
    "ID" INTEGER   NOT NULL,
    "Employee_ID" INTEGER   NOT NULL,
    "Dept_ID" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Managers" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Employees" (
    "ID" INTEGER   NOT NULL,
    "Dept_ID" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Salary" (
    "salary" INTEGER   NOT NULL,
    "Employee_ID" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "salary"
     )
);

CREATE TABLE "Titles" (
    "title" VARCHAR   NOT NULL,
    "Employee_ID" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title"
     )
);

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_Dept_ID" FOREIGN KEY("Dept_ID")
REFERENCES "Departments" ("ID");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_Dept_ID" FOREIGN KEY("Dept_ID")
REFERENCES "Departments" ("ID");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Dept_ID" FOREIGN KEY("Dept_ID")
REFERENCES "Departments" ("ID");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

