import 'package:firebase_auth/firebase_auth.dart';

import 'error_exception.dart';

class AuthRepository {
  FirebaseAuth? firebaseAuth = FirebaseAuth.instance;

  AuthRepository();

  String get message => '';

  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      print("=====================dasdasd=====");
      print(firebaseAuth);
      var user = await firebaseAuth?.createUserWithEmailAndPassword(
          email: email, password: password);
      print("====================ewewew=====");
      print(user?.user);
      return user?.user;
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw SignUpWithEmailAndPasswordFailure(message);
    }
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuth?.signInWithEmailAndPassword(
          email: email, password: password);

      print('8888');
      print(user);
      return user?.user;
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw LogInWithEmailAndPasswordFailure(message);
    }
  }

  Future<void> signOut() async {
    await firebaseAuth?.signOut();
  }

  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth?.currentUser;
    return currentUser != null;
  }

  Future<User?> getCurrentUser() async {
    return await firebaseAuth?.currentUser;
  }
}
