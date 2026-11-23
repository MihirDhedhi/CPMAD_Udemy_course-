void main() {
  greet();
  addNumbers();
  studentDetails();
}

// Function 1
void greet() {
  print("Hello, Welcome to Flutter");
}

// Function 2
void addNumbers() {
  int a = 10;
  int b = 20;
  print("Addition: ${a + b}");
}

// Function 3
void studentDetails() {
  String name = "Mihir";
  int age = 20;

  print("Name: $name");
  print("Age: $age");
}
