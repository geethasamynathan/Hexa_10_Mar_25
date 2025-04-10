// See https://aka.ms/new-console-template for more information
using Connectd_arch_demo;

Console.WriteLine("Hello, World!");

EmployeeCRUD employeeCRUD = new EmployeeCRUD();
employeeCRUD.GetAllEmployee();

//employeeCRUD.AddNewEmployee(11, "Bharathi1", "Female", "Chennai", "bharathi1@mail.com", 45645);
Employee employee = new Employee();
Console.WriteLine("Entet the employeeId,Name,Gender,Locationemail,Salary");
employee.Id = Convert.ToInt32(Console.ReadLine());
//employee.Name = Console.ReadLine();
//employee.Gender = Console.ReadLine();
//employee.Location = Console.ReadLine();
//employee.Email = Console.ReadLine();
//employee.Salary = Convert.ToDecimal(Console.ReadLine());
//employeeCRUD.UpdateEmployee(employee.Id, employee.Name, employee.Gender, employee.Location, employee.Email, employee.Salary);
employeeCRUD.DeleteEmployee(employee.Id);
//employeeCRUD.AddNewEmployee(employee.Id, employee.Name, employee.Gender, employee.Location,employee.Email,employee.Salary);
Console.ReadLine();