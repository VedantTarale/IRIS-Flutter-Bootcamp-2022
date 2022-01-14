import 'dart:io';
void main(){
  //Taking input as a srting and parsing it into an int to store in variable 'n'
  print("Please enter the number of terms required as the output: ");
  int? n=int.parse(stdin.readLineSync()!);
  if (n==0) { //Making 0 an invalud input and displaying an error
    print("Error");
  }
  else{
  print("\nFollowing are the first $n terms of the fibonacci series: \n");
  for (var i = 1; i <= n; i++) {  //Iterating for all the terms from 1 to n.
    print(fibonacci(i));  
  }
  }
}
int fibonacci(n){ //Recursive function to calculate nth term of fibonacci series. 
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