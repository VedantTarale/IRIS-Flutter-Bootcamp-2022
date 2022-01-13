import 'dart:io';
void main() {
  int sum = 0, condition = 1;
  print("Enter the total number of objects in the array: ");
  int? n = int.parse(stdin.readLineSync()!);
  List<int> array = List.filled(n, 0);
  for (var i = 0; i < n; i++) {
    print("Enter the value of element ${i + 1}");
    array[i] = int.parse(stdin.readLineSync()!);
    for (var j = 2; j < array[i]; j++) {
      condition = 1;
      if (array[i] == 1 || array[i] == 0) {
        condition = 0;
        break;
      }
      if (array[i] % j == 0) {
        condition = 0;
        break;
      }
    }
    if (condition == 1) {
      sum = sum + array[i];
    }
  }
  print("\nThe array is: $array\n");
  print("The sum of values of prime elements the array is: $sum\n");
  for (var i = 2; i < sum; i++) {
    condition = 1;
    if (sum % i == 0) {
      condition = 0;
      break;
    }
  }
  if (sum == 0) {
    print("There are no prime elements in the array");
  } else {
    if (condition == 1) {
      print("The sum is prime.");
    } else {
      print("The sum is NOT prime.");
    }
  }
}
