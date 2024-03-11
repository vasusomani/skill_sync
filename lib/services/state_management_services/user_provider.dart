import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_model.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier()
      : super(UserModel(
          id: '1',
          email: 'vasu@gmail.com',
          name: 'Vasu',
          age: 19,
          level: 'Beginner',
          phoneNumber: 9587118642,
          occupation: 'Student',
          gender: "Male",
          domain: "Flutter",
          subDomain: "Mobile Development",
        ));

  void setUser(UserModel user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel?>((ref) => UserNotifier());
