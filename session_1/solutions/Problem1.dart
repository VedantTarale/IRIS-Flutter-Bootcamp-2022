import 'dart:io';
void main(){
  print("Please enter the number of terms required as the output: ");
  int? n=int.parse(stdin.readLineSync()!);
  if (n==0) {
    print("Error");
  }
  else{
  print("\nFollowing are the first $n terms of the fibonacci series: \n");
  for (var i = 1; i <= n; i++) {
    print(fibonacci(i));
  }
  }
}
int fibonacci(n){
  int number;
  if(n==1){
    return 0;
  }
  if (n==2) {
    return 1;
  }
  else{
    number = fibonacci(n-1) + fibonacci(n-2);
    return number;
  }
}