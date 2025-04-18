// Lecture 05: Loops in Dart
// Instructor: Syed M Arsalan Shah

void main() {
  // For Loop - Counting from 1 to 10
  for (var i = 1; i <= 10; i++) {
    print("Index $i");
  }

  // For Loop - Counting Down from 11 to 0
  for (var i = 11; i >= 0; i--) {
    print("Index Descending $i");
  }

  // Multiplication Table of 5
  var number1 = 5;
  for (var i = 1; i <= 10; i++) {
    var multiply = number1 * i;
    print("$number1 * $i = $multiply");
  }

  // Counting Even and Odd Numbers from 1 to 50
  var counter = 0;
  for (var i = 1; i <= 50; i++) {
    if (i % 2 == 0) {
      counter++;
      print("Even $i");
    } else {
      print("Odd $i");
    }
  }
  print("Total Even Numbers Count: $counter");

  // Counting Leap Years from 2003 to 2025
  var startYear = 2003;
  var currentYear = 2025;
  var countLeapYear = 0;

  for (var i = startYear; i <= currentYear; i++) {
    if (i % 4 == 0) {
      countLeapYear++;
      print("Leap Year $i");
    } else {
      print("Not a Leap Year $i");
    }
  }
  print("Total Leap Years Count: $countLeapYear");

  // Factorial Calculation of 6
  var fact = 1;
  var number = 6;
  for (var i = 1; i <= number; i++) {
    fact *= i;
  }
  print("Factorial of $number is: $fact");

  // Summation from 1 to 10
  var sum = 0;
  var number2 = 10;
  for (var i = 1; i <= number2; i++) {
    sum += i;
  }
  print("Sum from 1 to $number2 is: $sum");
}
