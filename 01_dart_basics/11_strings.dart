void main() {
  String name = "Mihir Dhedhi";
  String course = "Flutter Development";

  // Print strings
  print("Name: $name");
  print("Course: $course");

  // String length
  print("Name length: ${name.length}");

  // Convert to uppercase and lowercase
  print("Uppercase: ${name.toUpperCase()}");
  print("Lowercase: ${name.toLowerCase()}");

  // Check string
  print("Contains Mihir: ${name.contains("Mihir")}");

  // Replace string
  print("Replace: ${name.replace("Mihir", "Student")}");

  // Trim spaces
  String text = "  Hello Flutter  ";
  print("Trimmed: '${text.trim()}'");
}
