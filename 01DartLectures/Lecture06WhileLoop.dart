// Lecture 06: While Loop in Dart
// Instructor: Syed M Arsalan Shah

void main() {
  // While Loop - Counting from 1 to 10
  var i = 1;
  while (i <= 10) {
    print("Index $i");
    i++;
  }

  // While Loop - Counting Down from 11 to 0
  i = 11;
  while (i >= 0) {
    print("Index Descending $i");
    i--;
  }

  // Multiplication Table of 5 using While Loop
  var number1 = 5;
  i = 1;
  while (i <= 10) {
    var multiply = number1 * i;
    print("$number1 * $i = $multiply");
    i++;
  }

  // Counting Even and Odd Numbers from 1 to 50 using While Loop
  var counter = 0;
  i = 1;
  while (i <= 50) {
    if (i % 2 == 0) {
      counter++;
      print("Even $i");
    } else {
      print("Odd $i");
    }
    i++;
  }
  print("Total Even Numbers Count: $counter");

  // Counting Leap Years from 2003 to 2025 using While Loop
  var startYear = 2003;
  var currentYear = 2025;
  var countLeapYear = 0;
  var year = startYear;

  while (year <= currentYear) {
    if (year % 4 == 0) {
      countLeapYear++;
      print("Leap Year $year");
    } else {
      print("Not a Leap Year $year");
    }
    year++;
  }
  print("Total Leap Years Count: $countLeapYear");

  // Factorial Calculation of 6 using While Loop
  var fact = 1;
  var number = 6;
  i = 1;
  while (i <= number) {
    fact *= i;
    i++;
  }
  print("Factorial of $number is: $fact");

  // Summation from 1 to 10 using While Loop
  var sum = 0;
  var number2 = 10;
  i = 1;
  while (i <= number2) {
    sum += i;
    i++;
  }
  print("Sum from 1 to $number2 is: $sum");
}
