import 'dart:io';

class OpenElective { //Creating class OpenElective
  List<String> courseName = List.filled(10, "0");
  List<String> courseCode = List.filled(10, "0");
  void viewOpenElective() { //Function for user-type-student to view open electives
    print("List of Open Electives:\n");
    for (var i = 0; i < 10; i++) {
      String holder = courseCode[i];
      if (courseCode[0] == "0") {
        print("No Open Electives.");
        break;
      }
      if (holder == "0") {
        break;
      } else {
        print("Course Name: ${courseName[i]}\tCourse Code: ${courseCode[i]}");
      }
    }
  }

  void addOpenElective(int index) { //function for user-type-admin to add open electives
    if (index > 9) { //Limiting the maximum number of entries to 10. (indexing from 0)
      print("Maximum number of entries reached!");
    } else {
      print("\nEnter Course Name:");
      String? temp1 = stdin.readLineSync();
      print("\nEnter Course Code:");
      String? temp2 = stdin.readLineSync();
      courseName[index] = temp1!;
      courseCode[index] = temp2!;
    }
  }
}

class BranchElective extends OpenElective {// Creating class BranchElective inheriting from class OpenElectives.
  List<String> branch = List.filled(10, "0");
  List<String> year = List.filled(10, "0");
  void addBranchElective(int i) { //  Function for user-type-admin to add Branch specific electives.
    print("Enter Course Name:");
    String? temp1 = stdin.readLineSync();
    print("Enter Course Code:");
    String? temp2 = stdin.readLineSync();
    print("Enter Branch:");
    String? temp3 = stdin.readLineSync();
    print("Enter Year:");
    String? temp4 = stdin.readLineSync();
    courseName[i] = temp1!;
    courseCode[i] = temp2!;
    branch[i] = temp3!;
    year[i] = temp4!;
  }

  void viewBranchElectives() { //Function for user-type-student to view Branchelectives for a particular Branch and Year
    if (courseCode[0] == "0") {
      print("No Branch Electives.");
      exit(0);
    }
    print("Enter Branch: ");
    String? b = stdin.readLineSync();
    print("Enter Year:");
    String? y = stdin.readLineSync();
    print("List of Branch Electives:");
    for (var i = 0; i < 10; i++) {
      if (branch[i] == b) {
        if (year[i] == y) {
          print("Course Name: ${courseName[i]}\tCourse Code: ${courseCode[i]}");
        }
      }
    }
  }
}

void main() {
  // Displaying Branch codes for entering into BranchElectives section.
  print("Branch Codes:");
  print("COMPUTER SCIENCE:  CSE");
  print("ARTIFICIAL INTELLIGENCE:  AI");
  print("INFORMATION TECHNOLOGY:  IT");
  print("ELECTRONICS AND COMM.:  ECE");
  print("ELECTRONICS AND ELEC.:  EEE");
  print("MECHANICAL: ME");
  print("CHEMICAL: CE");
  int indexOpen = 0;    //Index of array of open electives
  int indexBranch = 0;  //Index of array of branch electives
  bool condition = true;
  var user1 = OpenElective(); //crating object of class OpenElective
  var user2 = BranchElective(); //creating object of class BranchElective
  
  while (condition) { //Looping until the user opts out of the program


    print("Enter the type of user: 1.Admin 2.Student"); //Code to take input from the user
    print("Enter 0 to exit");
    String? input1 = stdin.readLineSync();
    if (input1 == "0") {
      condition = false;
      break;
    } else if (input1 == "1") {
      print("Enter course type: 1.Open Elective 2.Branch Elective");
      String? input2 = stdin.readLineSync();
      if (input2 == "1") {
        user1.addOpenElective(indexOpen);
        indexOpen++;
      } else if (input2 == "2") {
        user2.addBranchElective(indexBranch);
        indexBranch++;
      } else {
        print("INVALID INPUT");
      }
    } else if (input1 == "2") {
      user1.viewOpenElective();
      user2.viewBranchElectives();
    }
  }
}
