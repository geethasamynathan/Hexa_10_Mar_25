using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO_Disconnected_Demo
{
    public class EmployeeCRUD_Disconnected
    {
        string connectionString = @"Server=LAPTOP-0TBPBTEL\SQLEXPRESS;Database=Hexa_Mar_25;Trusted_Connection=True;TrustServerCertificate=True";
        public void GetAlEmployees()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM EMPLOYEE", conn);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds, "Employee");// dataTable ==> Datarow ,
                    foreach (DataRow dr in ds.Tables["Employee"].Rows)
                    {
                        Console.WriteLine($"Id:{dr["Id"]} \t Name={dr[1]} \t Gender={dr[2]} \t Location={dr[3]}");
                    }
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
        public void AddNewEmployee(Employee emp)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("Select * from Employee", connection);
                    SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds, "Employee");
                    DataRow newRow = ds.Tables["Employee"].NewRow();// adding a new row into dataTable
                    newRow["Id"] = emp.Id;
                    newRow["Name"] = emp.Name;
                    newRow["Gender"] = emp.Gender;
                    newRow["Location"] = emp.Location;
                    newRow["Email"] = emp.Email;
                    newRow["Salary"] = emp.Salary;
                    ds.Tables["Employee"].Rows.Add(newRow);
                    adapter.Update(ds, "Employee");
                    Console.WriteLine("REcord inserted successfully");
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
        public void UpdateEmployee(Employee emp)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("Select * from Employee", connection);
                    SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds, "Employee");
                    DataTable employeeTable = ds.Tables["Employee"];
                    employeeTable.PrimaryKey = new DataColumn[] { employeeTable.Columns["Id"] };
                    DataRow row = employeeTable.Rows.Find(emp.Id);// adding a new row into dataTable
                    if (row != null)
                    {
                         //row["Id"] = emp.Id;
                        row["Name"] = emp.Name;
                        row["Gender"] = emp.Gender;
                        row["Location"] = emp.Location;
                        row["Email"] = emp.Email;
                        row["Salary"] = emp.Salary;
                        adapter.Update(ds, "Employee");
                        Console.WriteLine("Record Updated successfully");
                    }
                    else
                    {
                        Console.WriteLine(" Employee Id was not found");
                    }

                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public void DeleteEmployee(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("Select * from Employee", connection);
                    SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds, "Employee");
                    DataTable employeeTable = ds.Tables["Employee"];
                    employeeTable.PrimaryKey = new DataColumn[] { employeeTable.Columns["Id"] };
                    DataRow row = employeeTable. Rows.Find(id);// adding a new row into dataTable
                    if (row != null)
                    {
                        row.Delete();
                        adapter.Update(ds, "Employee");
                        Console.WriteLine("Record Deleted successfully");
                    }
                    else
                    {
                        Console.WriteLine(" Employee Id was not found");
                    }

                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
    }
}
