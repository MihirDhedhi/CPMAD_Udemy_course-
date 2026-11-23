void main() {
  // Function with parameters
  greet("Mihir");

  // Function with two parameters
  add(10, 20);

  // Function with return value
  int result = multiply(5, 4);
  print("Multiplication: $result");

  // Function to calculate square
  int ans = square(6);
  print("Square: $ans");
}

// Function with parameter
void greet(String name) {
  print("Hello $name");
}

// Function with two parameters
void add(int a, int b) {
  print("Addition: ${a + b}");
}

// Function returning value
int multiply(int a, int b) {
  return a * b;
}

// Function returning square
int square(int number) {
  return number * number;
}
