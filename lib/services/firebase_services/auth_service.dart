import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_sync/view/functions/custom_toast.dart';

import '../../models/user_model.dart';
import '../state_management_services/user_provider.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Sign In using email and password
  Future<UserModel?> signInEmail(
      {required String email,
      required String password,
      required BuildContext context,
      required WidgetRef ref}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      //Get user complete data from Firestore and give it to provider
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user!.uid)
          .get();

      // UserModel myUser = UserModel(
      //     id: result.user!.uid, name: userData.data()!['name'], email: email);
      UserModel user = UserModel.fromJson(userData.data()!);
      ref.read(userProvider.notifier).setUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      CustomToast.bottomToast(e.message.toString());
      return null;
    }
  }

  //Sign Up using email and password
  Future<UserModel?> signUpEmail(
      {required UserModel user,
      required String password,
      required BuildContext context,
      required WidgetRef ref}) async {
    try {
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email: user.email!, password: password);
      String uid = await result.user.uid;
      user.id = uid;
      await _db.collection('users').doc(uid).set(user.toJson()).then((value) {
        ref.read(userProvider.notifier).setUser(user);
      });
      return user;
    } on FirebaseAuthException catch (e) {
      CustomToast.bottomToast(e.message.toString());
      return null;
    }
  }

  //Google SignIn
  Future<UserModel?> signInWithGoogle(
      {required BuildContext context, required WidgetRef ref}) async {
    final GoogleSignIn gSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? gUser = await gSignIn.signIn();
      if (gUser == null) return null;

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final AuthCredential gCredential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(gCredential);

      debugPrint(userCredential.user!.displayName);
      // UserModel myUser = UserModel(
      //     id: userCredential.user!.uid,
      //     name: userCredential.user!.displayName.toString(),
      //     email: userCredential.user!.email.toString());
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(
            userCredential.user!.uid,
          )
          .get();
      if (userData.data() != null) {
        UserModel user = UserModel.fromJson(userData.data()!);
        ref.read(userProvider.notifier).setUser(user);
        return user;
      } else {
        debugPrint("User not found");
        UserModel user = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName.toString(),
            email: userCredential.user!.email.toString());
        ref.read(userProvider.notifier).setUser(user);
        return user;
      }
    } on FirebaseAuthException catch (e) {
      CustomToast.bottomToast(e.message.toString());
      return null;
    }
  }

  //SignOut
  signOut(BuildContext context, WidgetRef ref) async {
    try {
      GoogleSignIn().signOut();
      _auth.signOut();
      ref.read(userProvider.notifier).clearUser();
    } on FirebaseAuthException catch (e) {
      CustomToast.bottomToast(e.message.toString());
    }
  }

  //Forgot Password
  forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
