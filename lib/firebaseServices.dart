import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final signingoogle = GoogleSignIn();

  googleSignin() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await signingoogle.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await auth.signInWithCredential(authCredential);
      }
    } catch (e) {
      print(e);
    }
  }

  googleSignout() async {
    await auth.signOut();
    await signingoogle.signOut();
  }
}
