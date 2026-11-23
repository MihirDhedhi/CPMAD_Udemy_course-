void main() {
  // Creating a list
  List<String> fruits = ["Apple", "Banana", "Mango", "Orange"];

  // Print complete list
  print("Fruits: $fruits");

  // Access list elements
  print("First fruit: ${fruits[0]}");
  print("Second fruit: ${fruits[1]}");

  // Add new element
  fruits.add("Grapes");
  print("After adding: $fruits");

  // Remove element
  fruits.remove("Banana");
  print("After removing: $fruits");

  // Using loop to print all elements
  print("All fruits:");
  for (int i = 0; i < fruits.length; i++) {
    print(fruits[i]);
  }
}
