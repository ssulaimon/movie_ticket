import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/const/colors.dart';

class EmailAuthentication {
  final String email;
  final String password;
  final String? name;
  EmailAuthentication({
    required this.email,
    required this.password,
    this.name,
  });
  static FirebaseAuth get firebase => FirebaseAuth.instance;

  static String get userName => firebase.currentUser!.displayName!;
  static String get userEmail => firebase.currentUser!.email!;

  Future<User?> createAccount() async {
    User? user;
    try {
      UserCredential userCredential =
          await firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name!);
        await user.reload();
        user = userCredential.user;
      }
      Get.snackbar(
        'Authentication Successful!!!',
        'Account Created',
        backgroundColor: CustomColors.white,
        colorText: CustomColors.black,
      );
      return user;
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'Authentication Failed',
        error.message.toString(),
        backgroundColor: CustomColors.white,
        colorText: CustomColors.black,
      );
      return user;
    }
  }

  Future<User?> loginToAccount() async {
    User? user;
    try {
      UserCredential userCredential = await firebase.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'Authentication Failed',
        error.message.toString(),
        backgroundColor: CustomColors.white,
        colorText: CustomColors.black,
      );
      return user;
    }
  }

  Future<void> sendResetPassword() async {
    await firebase
        .sendPasswordResetEmail(
          email: email,
        )
        .then((e) => Get.snackbar(
              'Authentication Successful',
              'Password Reset link sent',
              backgroundColor: CustomColors.white,
              colorText: CustomColors.black,
            ))
        .onError((error, stackTrace) => Get.snackbar(
              'Authentication Failed',
              error.toString(),
              backgroundColor: CustomColors.white,
              colorText: CustomColors.black,
            ));
  }
}
