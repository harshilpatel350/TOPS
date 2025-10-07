# Hospital Database

## Tables

*   **appointments**:
    *   `appointment_id` (INT, PRIMARY KEY)
    *   `patient_id` (INT, FOREIGN KEY referencing patients)
    *   `doctor_id` (INT, FOREIGN KEY referencing doctors)
    *   `appointment_date` (DATE)
    *   `status` (ENUM)
*   **doctors**:
    *   `doctor_id` (INT, PRIMARY KEY)
    *   `first_name` (VARCHAR(100))
    *   `last_name` (VARCHAR(100))
    *   `specialization` (VARCHAR(50))
    *   `department_id` (INT, FOREIGN KEY referencing departments)
*   **staff**:
    *   `staff_id` (INT, PRIMARY KEY)
    *   `first_name` (VARCHAR(50))
    *   `last_name` (VARCHAR(50))
    *   `designation` (VARCHAR(50))
    *   `department_id` (INT, FOREIGN KEY referencing departments)
*   **deleted_appointments_log**:
    *   `deleted_at` (DATETIME, PRIMARY KEY)
    *   `appointment_id` (INT)
    *   `doctor_id` (INT)
*   **billing**:
    *   `billing_id` (INT, PRIMARY KEY)
    *   `patient_id` (INT, FOREIGN KEY referencing patients)
    *   `treatment_id` (INT, FOREIGN KEY referencing treatments)
    *   `billing_date` (DATE)
    *   `amount` (DECIMAL(10,2))
*   **patients**:
    *   `patient_id` (INT, PRIMARY KEY)
    *   `first_name` (VARCHAR(50))
    *   `last_name` (VARCHAR(50))
    *   `dob` (DATE)
    *   `contact` (VARCHAR(15))
    *   `address` (VARCHAR(150))
*   **treatments**:
    *   `treatment_id` (INT, PRIMARY KEY)
    *   `doctor_id` (INT, FOREIGN KEY referencing doctors)
    *   `patient_id` (INT, FOREIGN KEY referencing patients)
    *   `description` (TEXT)
    *   `cost` (DECIMAL(10,2))
*   **departments**:
    *   `department_id` (INT, PRIMARY KEY)
    *   `name` (VARCHAR(150))
    *   `location` (VARCHAR(150))

## Relationships

*   `appointments` references `patients` (one-to-many)
*   `appointments` references `doctors` (one-to-many)
*   `doctors` references `departments` (one-to-many)
*   `staff` references `departments` (one-to-many)
*   `billing` references `patients` (one-to-many)
*   `billing` references `treatments` (one-to-many)
*   `treatments` references `doctors` (one-to-many)
*   `treatments` references `patients` (one-to-many)
