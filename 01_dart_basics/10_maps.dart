void main() {
  // Creating a map
  Map<String, dynamic> student = {
    "name": "Mihir",
    "age": 20,
    "course": "ICT",
    "semester": 5,
  };

  // Printing complete map
  print("Student Details: $student");

  // Accessing values
  print("Name: ${student["name"]}");
  print("Age: ${student["age"]}");
  print("Course: ${student["course"]}");
  print("Semester: ${student["semester"]}");

  // Adding new key-value pair
  student["city"] = "Rajkot";
  print("After adding city: $student");

  // Updating value
  student["age"] = 21;
  print("Updated age: ${student["age"]}");

  // Removing key-value pair
  student.remove("semester");
  print("After removing semester: $student");
}
