using System.Reflection;

namespace CalculatorTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {
            Assert.Pass();
        }

        [TearDown]
        public void TearDown()
        {

        }
    }
}
/*
 * A => Arrange
 * A ==>Act
 *  A=> Assert
 */