import 'package:get/get.dart';

class ObeSheetController extends GetxController {
  // List of students and their scores
  var students = <Student>[].obs;

  // Add student to list
  void addStudent(Student student) {
    students.add(student);
  }

  // Remove student from list
  void removeStudent(int index) {
    students.removeAt(index);
  }

  // Update student scores
  void updateStudentScores(int index, Student updatedStudent) {
    students[index] = updatedStudent;
  }
}

class Student {
  final String name;
  final String rollNo;
  RxMap<String, double> scores; // This will store CLOs and corresponding scores

  Student({required this.name, required this.rollNo, required this.scores});
}
