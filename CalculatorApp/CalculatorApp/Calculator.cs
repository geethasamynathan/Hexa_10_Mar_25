using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorApp
{
    public class Calculator
    {
        public int Add(int num1, int num2) 
        {
            return num1+num2;
        }
        public int Divide(int num1, int num2)
        {
            if (num2 == 0)
                throw new DivideByZeroException("Cannot divide by Zero");
            return num1 /num2;
        }

        public bool IsEven(int num)
        {
            return num % 2 == 0;
        }

        public string GetGrade(int score)
        {
            if (score < 0 || score > 100)
                throw new ArgumentOutOfRangeException("Score must be 0 to 100");
            if (score >= 90) return "A";
            if(score>=80) return "B";
            if(score>=70) return "C";
            if(score>=60) return "D";
            return "F";
        }
    }
}
