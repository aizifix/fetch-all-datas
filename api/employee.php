<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    
    function fetchAllEmployees() {
        include "connection.php";
    
        $sql = "SELECT e.emp_id, e.emp_name, e.emp_basic_salary, d.department_text, s.stat_text 
                FROM tblemployees e
                INNER JOIN tblemployeedepartment d ON e.emp_department_id = d.department_id
                INNER JOIN tblemploymentstatus s ON e.emp_employee_status = s.stat_id
                ORDER BY e.emp_name";
        
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    function fetchAllDepartment() {
        include "connection.php";
        
        $sql = "SELECT * FROM tblemployeedepartment";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    function fetchAllEmploymentStatus() {
        include "connection.php";
        
        $sql = "SELECT * FROM tblemploymentstatus";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    $action = isset($_GET['action']) ? $_GET['action'] : '';
    
    switch ($action) {
        case 'all':
            $employees = fetchAllEmployees();
            $departments = fetchAllDepartment();
            $statuses = fetchAllEmploymentStatus();
            
            // Return all data in a single response
            echo json_encode([
                'employees' => $employees,
                'departments' => $departments,
                'statuses' => $statuses
            ]);
            break;
        default:
            echo json_encode(['error' => 'Invalid action']);
            break;
    }
    
?>