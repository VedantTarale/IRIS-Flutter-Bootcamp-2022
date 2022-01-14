import 'dart:io';
void main() {
  int sum = 0, condition = 1;

  print("Enter the total number of objects in the array: "); 
  int? n = int.parse(stdin.readLineSync()!); //Taking user input "n" for the total number of elements in the array.
  List<int> array = List.filled(n, 0);  //Declating an filled array of n elements and default value 0;
  
  for (var i = 0; i < n; i++) { 
    print("Enter the value of element ${i + 1}");
    array[i] = int.parse(stdin.readLineSync()!);  //Taking element value for each index.
    
    for (var j = 2; j < array[i]; j++) {  // for loop to check whether the element at a particular index is a prime.
      condition = 1;
      if (array[i] == 1 || array[i] == 0) { // 0 and 1 are not primes.
        condition = 0;
        break;
      }
      if (array[i] % j == 0) {  // if any factor exists other than 1 and the number then NOT A PRIME
        condition = 0;
        break;
      }
    }
    if (condition == 1) { //If the number is prime it is added to the sum.
      sum = sum + array[i];
    }
  }

  print("\nThe array is: $array\n");
  print("The sum of values of prime elements the array is: $sum\n");
  for (var i = 2; i < sum; i++) { //Checking if the sum is prime
    condition = 1;
    if (sum % i == 0) {
      condition = 0;  // if not a prime then ocndition = 0;
      break;
    }
  }
  if (sum == 0) { //If sum is 0 indicate that there were no prime elemnets in the arrray.
    print("There are no prime elements in the array");
  } 
  else if (condition == 1) {  // conditoin=1 indicates that the sum is prime.
      print("The sum is prime.");
    } else {
      print("The sum is NOT prime.");
    }
}

