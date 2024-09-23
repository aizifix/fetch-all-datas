"use client";

import { useEffect, useState } from "react";
import axios from "axios";

interface Employee {
  emp_id: number;
  emp_name: string;
  emp_basic_salary: string;
  department_text: string;
  stat_text: string;
}

interface Department {
  department_id: number;
  department_text: string;
}

interface Employment {
  stat_id: number;
  stat_text: string;
}

const EmployeeList = () => {
  const [employees, setEmployees] = useState<Employee[]>([]);
  const [departments, setDepartments] = useState<Department[]>([]);
  const [employments, setEmployments] = useState<Employment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    axios
      .get("http://localhost/employee-api/employee.php?action=all")
      .then((response) => {
        const data = response.data;
        setEmployees(data.employees);
        setDepartments(data.departments);
        setEmployments(data.statuses);
        setLoading(false);
      })
      .catch((err) => {
        setError("Failed to fetch data");
        setLoading(false);
      });
  }, []);

  if (loading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>{error}</p>;
  }

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Employee List</h1>
      <table className="min-w-full border-collapse block md:table">
        <thead className="block md:table-header-group">
          <tr className="border border-gray-300 md:border-none md:table-row">
            <th className="p-2 text-left block md:table-cell">Name</th>
            <th className="p-2 text-left block md:table-cell">Department</th>
            <th className="p-2 text-left block md:table-cell">Status</th>
            <th className="p-2 text-left block md:table-cell">Base Salary</th>
          </tr>
        </thead>
        <tbody className="block md:table-row-group">
          {employees.map((employee) => (
            <tr key={employee.emp_id} className="border border-gray-300 md:border-none md:table-row">
              <td className="p-2 block md:table-cell">{employee.emp_name}</td>
              <td className="p-2 block md:table-cell">{employee.department_text}</td>
              <td className="p-2 block md:table-cell">{employee.stat_text}</td>
              <td className="p-2 block md:table-cell">{employee.emp_basic_salary}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h1 className="font-bold text-xl mt-6">Department List</h1>
      <table className="min-w-full border-collapse block md:table">
        <thead className="block md:table-header-group">
          <tr className="border border-gray-300 md:border-none md:table-row">
            <th className="p-2 text-left block md:table-cell">Name</th>
          </tr>
        </thead>
        <tbody className="block md:table-row-group">
          {departments.map((department) => (
            <tr key={department.department_id} className="border border-gray-300 md:border-none md:table-row">
              <td className="p-2 block md:table-cell">{department.department_text}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h1 className="font-bold text-xl mt-6">Employment List</h1>
      <table className="min-w-full border-collapse block md:table">
        <thead className="block md:table-header-group">
          <tr className="border border-gray-300 md:border-none md:table-row">
            <th className="p-2 text-left block md:table-cell">Name</th>
          </tr>
        </thead>
        <tbody className="block md:table-row-group">
          {employments.map((employment) => (
            <tr key={employment.stat_id} className="border border-gray-300 md:border-none md:table-row">
              <td className="p-2 block md:table-cell">{employment.stat_text}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default EmployeeList;
