import 'dart:io';
bool checkPrime(double a){
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
  print("Enter the number(positive integer) to be checked: ");
  int input = int.parse(stdin.readLineSync()!);
  double temp;
  bool condition = true;
  for (double i = 2; i < input; i++) {
    if(input%i==0){
      if (checkPrime(i)) {
      temp = input/i;
      if(checkPrime(temp)){
        print("The number is semiprime and the prime factors are: $i and $temp");
        condition = false;
        break;
      }
    }
    }
  }
  if (condition) {
    print("The number is NOT a semi-prime");
  }
}