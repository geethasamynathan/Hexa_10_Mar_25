using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Connectd_arch_demo
{
    public class EmployeeCRUD
    {
        string connectionString = "Server=LAPTOP-0TBPBTEL\\SQLEXPRESS;Database=Hexa_Mar_25;Integrated Security=True;TrustServerCertificate=True";
        string connectionString1 = "Data Source=LAPTOP-0TBPBTEL\\SQLEXPRESS;Initial Catalog=Hexa_Mar_25;Integrated Security=True";

        public void AddNewEmployee(int id,string name,string gender,string location,string email,decimal salary)
        {
            try {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //string query= $"INSERT INTO EMPLOYEE (Id,Name,Gender,Location,Email,salary)" +
                    //    $"VALUES({id},'{name}','{gender}'" +
                    //    $",'{location}','{email}',{salary})";

                    string query = $"INSERT INTO EMPLOYEE (Id,Name,Gender,Location,Email,Salary) VALUES (@Id,@Name,@Gender,@Location,@Email,@Salary)";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Salary", salary);
                    connection.Open();
                    int rowsadded = cmd.ExecuteNonQuery();
                    if (rowsadded > 0)
                    {
                        Console.WriteLine("Record inserted successfully");
                    }
            
                    else
                    {
                        Console.WriteLine("Somethingwent wrong while inserting record");
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            
        }
        public void UpdateEmployee(int id, string name, string gender, string location, string email, decimal salary)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //string query= $"INSERT INTO EMPLOYEE (Id,Name,Gender,Location,Email,salary)" +
                    //    $"VALUES({id},'{name}','{gender}'" +
                    //    $",'{location}','{email}',{salary})";

                    string query = $"Update EMPLOYEE set Name=@Name,Gender=@Gender," +
                        $"Location=@Location,Email=@Email,Salary=@Salary WHERE Id=@Id";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Salary", salary);
                    connection.Open();
                    int rowsadded = cmd.ExecuteNonQuery();
                    if (rowsadded > 0)
                    {
                        Console.WriteLine("Record updated successfully");
                    }
                    else
                    {
                        Console.WriteLine("Somethingwent wrong while updating the record");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }
        public void DeleteEmployee(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //string query= $"INSERT INTO EMPLOYEE (Id,Name,Gender,Location,Email,salary)" +
                    //    $"VALUES({id},'{name}','{gender}'" +
                    //    $",'{location}','{email}',{salary})";

                    string query = $"Delete from EMPLOYEE  WHERE Id=@Id";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@Id", id);
                    connection.Open();
                    int rowsadded = cmd.ExecuteNonQuery();
                    if (rowsadded > 0)
                    {
                        Console.WriteLine("Record Deleted successfully");
                    }
                    else
                    {
                        Console.WriteLine("Somethingwent wrong while updating the record");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
            public void GetAllEmployee()
            {
                try
                {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = $"SELECT * from EMPLOYEE";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"{reader[0]} \t {reader["Name"]}\t {reader[2]}\t {reader[3]}\t {reader[4]} \t {reader[5]}");
                    }
                }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }

            }
        }
}
