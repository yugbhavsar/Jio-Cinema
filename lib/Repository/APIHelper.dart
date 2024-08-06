import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class API {

  //provider
  API.internal();

  //instance
  static final API _instance = API.internal();

  //with static filed
  static API get instance => _instance;

  Future signupUser (String email , String password , Function(String, int) completion) async {
    try{
      final _ = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      completion(APIMessages.signupSuccess,200);
    }on FirebaseAuthException catch (e) {
      completion(e.code,500);
    }catch (e) {
      completion(e.toString(),500);
    }
  }

  Future<UserCredential?> signupWithSocial(bool isFacebook) async {
    try{
      if (isFacebook){
       final loginResult = await FacebookAuth.instance.login();
       final fbCredential = await FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

       return await FirebaseAuth.instance.signInWithCredential(fbCredential);
      }else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser
            ?.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    }on FirebaseAuthMultiFactorException catch (e) {
      print(e.code);
    }catch (e) {
      print(e.toString());
    }

    

  }

}






class APIMessages {

  // Signup Messages
  static String signupSuccess = "You have successfully signed up for EventHub!";
  static String signupFailure = "Signup failed. Please try again.";

  // Login Messages
  static String loginSuccess = "You have successfully logged in to EventHub!";
  static String loginFailure = "Login failed. Please check your credentials and try again.";

  // Password Reset Messages
  static String passwordResetSuccess = "Your password has been reset successfully.";
  static String passwordResetFailure = "Password reset failed. Please try again.";

  // Profile Update Messages
  static String profileUpdateSuccess = "Your profile has been updated successfully.";
  static String profileUpdateFailure = "Profile update failed. Please try again.";

  // Profile Fields Update Messages
  static String nameChangeSuccess = "Your name has been updated successfully.";
  static String nameChangeFailure = "Name update failed. Please try again.";
  static String profilePictureChangeSuccess = "Your profile picture has been updated successfully.";
  static String profilePictureChangeFailure = "Profile picture update failed. Please try again.";
  static String emailChangeSuccess = "Your email has been updated successfully.";
  static String emailChangeFailure = "Email update failed. Please try again.";
  static String passwordUpdateSuccess = "Your password has been updated successfully.";
  static String passwordUpdateFailure = "Password update failed. Please try again.";

  // Global Error Message
  static String globalError = "An error occurred while loading data. Please try again later.";
}