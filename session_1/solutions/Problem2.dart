import 'dart:io';
bool checkPrime(double a){  //Function to check if a number is prime or not
    if (a==1)return false;
    else
    {
    for (var i = 2; i < a; i++) {
      if (a%i==0) {
      return false;
    }
    }
    return true;
    }
}
void main(){
  print("Enter the number(positive integer) to be checked: ");    //Taking input from user
  int input = int.parse(stdin.readLineSync()!);                   //converting string input into interger and storing it in variable 'input'
  double temp;
  bool condition = true;  //default condition true for number not being a semi-prime.
  
  for (double i = 2; i < input; i++) { //Loop section to check whether a number is semi-prime
    if(input%i==0){
      if (checkPrime(i)) {  // Checking if "i" is a prime
      temp = input/i;       // obtaining the complement factor of "input" correspinding to i.
      if(checkPrime(temp)){ // Checking if the complementary factor is a prime.
        print("The number is semiprime and the prime factors are: $i and $temp"); //All conditions satisfied --> "input" is a semiprime numebr.
        condition = false;
        break;  //Exit the loop if the number is able to satisfy the condition for being semi-prime
      }
    }
    }
  }
  if (condition) {  //  If number is found not to be a semiprime after the iteration then print the default condition result.
    print("The number is NOT a semi-prime");
  }
}