// See https://aka.ms/new-console-template for more information
using ADO_Disconnected_Demo;

EmployeeCRUD_Disconnected employeeCRUD = new EmployeeCRUD_Disconnected();
Console.WriteLine("Enter the choice 1-4 \n 1.GetallEmployees \n " +
    "2. Add New employee \n 3.Update Employee \n 4.Delete Employee");
int choice = Convert.ToInt32(Console.ReadLine());

switch (choice)
{
    case 1:
        employeeCRUD.GetAlEmployees();
        break;
    case 2: Employee emp = GetEmployeeInfo(); employeeCRUD.AddNewEmployee(emp); break;

    case 3: Employee updateEmp = GetEmployeeInfo(); employeeCRUD.UpdateEmployee(updateEmp); break;

    case 4:
        {
            Console.WriteLine("Enter the employee id to Delete ");
            int id = Convert.ToInt32(Console.ReadLine());
            employeeCRUD.DeleteEmployee(id); break;
        }

}

        employeeCRUD.GetAlEmployees();

        static Employee GetEmployeeInfo()
        {
            Employee employee = new Employee();
            Console.WriteLine("Entet the employeeId,Name,Gender,Locationemail,Salary");
            employee.Id = Convert.ToInt32(Console.ReadLine());
            employee.Name = Console.ReadLine();
            employee.Gender = Console.ReadLine();
            employee.Location = Console.ReadLine();
            employee.Email = Console.ReadLine();
            employee.Salary = Convert.ToDecimal(Console.ReadLine());
            return employee;
        }
        //employeeCRUD.AddNewEmployee(employee);
        Console.ReadLine();


