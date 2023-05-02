# PLpsSQL

* [**Introduction**](#Introduction)
* [**Database**](#Database)
* [**Functions**](#Functions)
* [**Triggers**](#Triggers)
* [**Cursors**](#Cursors)
* [**Procedures**](#Procedures)

## Introduction

In this assigment we are going to create a database in **postgres** and try **functions, cursors, triggers and procedure**.

## Database

For this assigment I'm going to use an restauran database with 4 tables:

- Employees
- Providers
- Inventory
- Commands

Here you have the [ddl.sql](https://github.com/FranN2442/PLpsSQL/blob/master/ddl.sql) and [dml.sql](https://github.com/FranN2442/PLpsSQL/blob/master/dml.sql).

## Functions

A function is a way to encapsulate a series of actions to later execute them as one.

Here we have an example of functions on PL/psSQL:

```
CREATE FUNCTION insert_employee(
    p_name VARCHAR(50),
    p_position VARCHAR(50),
    p_salary DECIMAL(8,2)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO employees (name, position, salary)
    VALUES (p_name, p_position, p_salary);
END;
$$ LANGUAGE plpgsql;
```

This function inserts an employee on the table employees, to create the function we use ``` CREATE FUNCTION ``` and we put as parameters the name of the rows.
This function does not return anything so before starting it we will indicate it with ``` RETURNS VOID ```, ``` BEGIN ``` starts the function then we write the actions and then ends with ``` END ``` to finish the function.

## Tringgers

PL/psSQL also supports triggers, which are special functions that are automatically executed in response to certain events, such as inserting or updating a row in a table.

Lets see an example of **Trigger**:

```
CREATE OR REPLACE FUNCTION update_salary_employee()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE employees SET salary = salary + NEW.total * 0.1
    WHERE id = NEW.employee_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_salary_employee_trigger
AFTER INSERT OR UPDATE ON commands
FOR EACH ROW
EXECUTE FUNCTION update_salary_employee();
```

This function will be executed after each insert or update in the command table, and will update the salary of the corresponding employee in the employee table. The salary update is done by adding 10% of the total command to your current salary.

## Cursors

In PL/psSQL, cursors are used to iterate over the rows returned by a SELECT statement. Lets iterate over eployees table:

```
DECLARE employee_cursor CURSOR FOR SELECT id, name, salary FROM employees;
OPEN employee_cursor;
LOOP
    FETCH employee_cursor INTO employee_id, employee_name, employee_salary;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'El empleado % con ID % tiene un salario de %', employee_name, employee_id, employee_salary;
END LOOP;
CLOSE employee_salary;
```

This Cursor iterates over the employees table and takes all the values and saves it into variables, then creates an message and uses the variables to complement the message.

## Procedures

Procedures allow you to perform more complex and advanced operations than can be performed with standard SQL queries. For example, they can include control flow logic such as loops, conditions, and exceptions, allowing you to perform calculations, validations, and other complex operations.

```
CREATE OR REPLACE PROCEDURE get_commands_by_employee(
    IN p_employee_id INT,
    OUT p_total_commands INT,
    OUT p_total_sells DECIMAL(8,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COUNT(*) INTO p_total_commands, SUM(total) INTO p_total_sells
    FROM commands
    WHERE employee_id = p_employee_id;
END;
$$;
```

This query is made to the command table that returns the total number of commands and the sum of the total commands for the employee specified by p_employee_id. The results are assigned to the output variables p_total_commands and p_total_sells.

To call the procedure execute:

```
CALL get_commands_by_employees(1, p_total_commands, p_total_sells);
```





