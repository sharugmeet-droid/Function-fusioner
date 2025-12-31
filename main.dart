import 'dart:io';

/// Function to double a number
int doubleNumber(int n) => n * 2;

/// Function to square a number
int squareNumber(int n) => n * n;

/// Function to process a list with a given operation
List<int> processList(List<int> numbers, int Function(int) operation) {
  return numbers.map(operation).toList();
}

void main() {
  print("🎉 Welcome to Function Fusioner! 🎉");

  while (true) {
    stdout.write("Enter a list of numbers separated by commas (0 to exit): ");
    String? input = stdin.readLineSync();

    if (input == null || input.trim() == "") continue;

    // Exit condition
    if (input.trim() == "0") {
      print("Thanks for using Function Fusioner! Goodbye!");
      break;
    }

    // Convert input to list of integers
    List<int> numbers = input.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList();

    // Choose operation
    print("Choose an operation to apply:");
    print("1. Double each number");
    print("2. Square each number");
    stdout.write("Enter 1 or 2: ");
    String? choice = stdin.readLineSync();

    List<int> result = [];
    if (choice == "1") {
      result = processList(numbers, doubleNumber);
      print("✅ Result after doubling: $result\n");
    } else if (choice == "2") {
      result = processList(numbers, squareNumber);
      print("✅ Result after squaring: $result\n");
    } else {
      print("⚠️ Invalid choice. Try again.\n");
      continue;
    }

    // Option to continue
    stdout.write("Do you want to process another list? (y/n): ");
    String? again = stdin.readLineSync();
    if (again == null || again.toLowerCase() != 'y') {
      print("Thanks for using Function Fusioner! Goodbye!");
      break;
    }
  }
}
