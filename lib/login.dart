import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:hubbles/registration.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 80,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                'https://i.pinimg.com/736x/31/41/6d/31416d4c06cad9f0ea9022076645289f.jpg',
              ),
              Text(
                'hubbles'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  signInWithGoogle(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      60,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://icon2.cleanpng.com/20240216/eyb/transparent-google-logo-google-logo-green-and-blue-g-in-circle65cf691984e008.0012613817080916735443.jpg',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Continue with google',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'By continuing you agree to our ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms and conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signInWithGoogle(BuildContext context) async {
    try {
      // Configure the scopes for YouTube permissions
      const List<String> scopes = [
        'https://www.googleapis.com/auth/youtube.readonly',
      ];

      // Sign in with Google and request additional scopes
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: scopes).signIn();

      // Get the access token and ID token
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final String? accessToken = googleAuth?.accessToken;
      final String? idToken = googleAuth?.idToken;

      // Get the Firebase credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      // Sign in with Firebase
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // If login is successful, navigate to the next screen

      if (userCredential.user != null) {
        // Navigate to the home screen using Get.to
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Registration(
              name: '${userCredential.user!.displayName}',
            ),
          ),
        );
      }
    } catch (e) {
      // Handle errors
      print('Error signing in with Google: $e');
      // Display a snackbar or dialog to inform the user about the error
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Failed to sign in with Google'),
      ));
    }
  }

// Add the following method inside the Login class
}
