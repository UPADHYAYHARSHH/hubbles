import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

addUser(String name, int age, DateTime birthdate) {
  // Generate a unique ID for the user
  String? userId = databaseReference.child('users').push().key;

  // Add user data with the generated ID
  databaseReference.child("users").child(userId!).set({
    'name': name,
    'age': age,
    'birthdate': birthdate.toIso8601String(),
  });
}
