using CalculatorApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorTest
{
    [TestFixture]
    public class CalculatorTest
    {

        private Calculator _calculator;
        [SetUp]
        public void Setup()
        {
            _calculator = new Calculator();
        }

        [Test]
        public void WhenCalled_Add_Then_ReturnSum()
        {
            int num1 = 200;
            int num2 = 900;
            int expectedResult = num1 + num2;
           int  actualResult=_calculator.Add(num1 ,num2);
            Assert.That(expectedResult, Is.EqualTo(actualResult));
        }


        [Test]
        public void WhenCalled_AddWithNegativeValues_Then_ReturnscorrectSum()
        {
            int num1 = -200;
            int num2 = 900;
            int expectedResult = num1 + num2;
            int actualResult = _calculator.Add(num1, num2);
            Assert.That(expectedResult, Is.EqualTo(actualResult));
        }
        [TestCase(1, 1, 2)]
        [TestCase(5, 5, 10)]
        [TestCase(-1, -1, -2)]
        [TestCase(0, 0, 0)]
        [TestCase(100, -100, 0)]
        public void Add_MultipleInputs_ReturnsExpectedResults(int a, int b, int expected)
        {
            // Act
            int result = _calculator.Add(a, b);

            // Assert
            Assert.That(result, Is.EqualTo(expected));
        }

        [Test]
        public void Divide_ValidDivisor_ReturnQuotient()
        {
            int num1 = 10;
            int num2 = 2;
            int actualResult=_calculator.Divide(num1 ,num2);
            Assert.That(actualResult, Is.EqualTo(5));
        }
        [Test]
        public void Divide_When_DivideByZero_ThrowsExceptionDivideByZero()
        {
            int num1 = 10;
            int num2 = 0;
            Assert.Throws<DivideByZeroException>(()=>_calculator.Divide(num1, num2));
        }
        [Test]
        public void IsEven_When_InputIsEven_ReturnTrue()
        {
            int num1 = 10;
            
            bool actualResult = _calculator.IsEven(num1);
            Assert.That(actualResult, Is.EqualTo(true));
        }
        [Test]
        public void IsEven_When_InputIsNotEven_ReturnFalse()
        {
            int num1 = 11;

            bool actualResult = _calculator.IsEven(num1);
            Assert.That(actualResult, Is.EqualTo(false));
        }
        [TestCase(2, true)]
        [TestCase(4, true)]
        [TestCase(100, true)]
        [TestCase(1, false)]
        [TestCase(3, false)]
        [TestCase(99, false)]
        public void IsEven_VariousInputs_ReturnsExpectedResults(int input, bool expected)
        {
            // Act
            bool result = _calculator.IsEven(input);

            // Assert
            Assert.That(result, Is.EqualTo(expected));
        }
        [TestCase(95,"A")]
        [TestCase(85, "B")]
        [TestCase(75, "C")]
        [TestCase(65, "D")]
        [TestCase(50, "F")]

        public void GetGrade_ValidAscores_REturnscorrectGrade(int score,string expectedGrade)
        {
            string result = _calculator.GetGrade(score);
            Assert.That(result,Is.EqualTo(expectedGrade));
        }
        [TestCase(-5)]
        [TestCase(120)]
        public void GetGrade_When_InValidscores_ThrowsArgumentException(int score)
        {
           
            Assert.Throws<ArgumentOutOfRangeException>(()=>_calculator.GetGrade(score));
        }
    }
}
