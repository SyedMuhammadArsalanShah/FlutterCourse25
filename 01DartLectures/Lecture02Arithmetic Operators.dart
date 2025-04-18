// Lecture 02: Arithmetic Operators in Dart
// Instructor: Syed M Arsalan Shah

void main() {
  // Declaring and initializing two numbers
  int num1 = 75;
  int num2 = 100;

  // Performing arithmetic operations
  int add = num1 + num2;
  int sub = num1 - num2;
  int mul = num1 * num2;
  double div = num1 / num2;
  int mod = num1 % num2;

  // Integer division using ~/ operator
  int divInt = num1 ~/ num2;

  // Printing results
  print("Addition: $add");
  print("Subtraction: $sub");
  print("Multiplication: $mul");
  print("Division: $div");
  print("Integer Division: $divInt");
  print("Modulus (Remainder): $mod");
}
