# Salon Management System

This project is a salon management system that allows users to schedule appointments for different services.

## Project Description

The salon management system fulfills the following user stories:

- **User Story #1**: There should be a database named "salon" created.
- **User Story #2**: Tables named "customers", "appointments", and "services" should be created in the "salon" database.
- **User Story #3**: Each table should have a primary key column that automatically increments, following the naming convention "table_name_id".
- **User Story #4**: The "appointments" table should have a "customer_id" foreign key that references the "customer_id" column from the "customers" table.
- **User Story #5**: The "appointments" table should have a "service_id" foreign key that references the "service_id" column from the "services" table.
- **User Story #6**: The "customers" table should have a "phone" column that is a VARCHAR and must be unique.
- **User Story #7**: The "customers" and "services" tables should have a "name" column.
- **User Story #8**: The "appointments" table should have a "time" column that is a VARCHAR.
- **User Story #9**: There should be at least three rows in the "services" table for the different services offered, one with a "service_id" of 1.
- **User Story #10**: A script file named "salon.sh" should be created in the project folder.
- **User Story #11**: The script file should have executable permissions.
- **User Story #12**: The script should display a numbered list of the services offered before the first prompt for input.
- **User Story #13**: If an invalid service_id is entered, the script should display the list of services again.
- **User Story #14**: The script should prompt users to enter a service_id, phone number, name if they aren't already a customer, and a time.
- **User Story #15**: If a phone number entered doesn’t exist, the script should prompt for the customer's name and insert both phone number and name into the customers table.
- **User Story #16**: If the phone number already exists, the script should directly prompt for the service_id and time.
- **User Story #17**: After an appointment is successfully added, the script should output a message confirming the appointment details.

## Tools and Technologies

- PostgreSQL
- Bash scripting

## Example Usage

To use the salon management system, follow these steps:

1. Run the "salon.sh" script.
2. Enter the service_id of the desired service.
3. Enter the phone number.
4. If the phone number doesn't exist, enter the customer's name.
5. Enter the appointment time.
6. Confirm the appointment details displayed.
