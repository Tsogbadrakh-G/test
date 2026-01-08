import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// User model class

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // Factory constructor for creating a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  @override
  String toString() => 'User(id: $id, name: $name, email: $email)';
}

final userNameProvider = StateNotifierProvider<UserNotifier, String>((ref) {
  // we can also return an empty String here, for the sake of simplicity,
  //  let's return a sample name
  //hello world
  return UserNotifier('Tsog');
});

class UserNotifier extends StateNotifier<String> {
  UserNotifier(super._state);
  void updateName(String n) {
    state = n;
  }
}
