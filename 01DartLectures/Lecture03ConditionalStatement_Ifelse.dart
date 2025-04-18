// Lecture 03: Conditional Statements in Dart
// Instructor: Syed M Arsalan Shah


void main() {
  // User details
  String name = "Syed M Arsalan Shah";
  String email = "smas@gmail.com";
  String password = "1234";

  // Login credentials
  String emailLogin = "smas@gmail.com";
  String passwordLogin = "1234";

  // If/Else Simple Condition for Login System
  if (emailLogin == email && password == passwordLogin) {
    print("Account Successfully Logged In");
    print("Welcome, $name");

    // Nested If/Else Condition: Checking if a number is positive or negative
    int number1 = -10;
    if (number1 > 0) {
      print("The number is Positive");
    } else {
      print("The number is Negative");
    }

    // If/Else Ladder: Grading System
    double eng, urdu, isl, obt, per;
    eng = 19;
    urdu = 10;
    isl = 40;

    obt = eng + urdu + isl;
    per = (obt / 300) * 100;

    print("Obtained Marks: $obt ");
    print("Percentage: ${per.toStringAsFixed(2)}%");

    if (per <= 100 && per >= 80) {
      print("Grade: A1");
    } else if (per <= 79 && per >= 70) {
      print("Grade: A");
    } else if (per <= 69 && per >= 60) {
      print("Grade: B");
    } else if (per <= 59 && per >= 50) {
      print("Grade: C");
    } else if (per <= 49 && per >= 40) {
      print("Suggestion: Improve Your Studies");
    } else {
      print("Status: Failed, Please Try Again");
    }

    // Leap Year Checker
    int year = 2025;
    if (year % 4 == 0) {
      print("$year is a Leap Year");
    } else {
      print("$year is Not a Leap Year");
    }
  } else {
    print("Error: Incorrect Email or Password");
  }
}
