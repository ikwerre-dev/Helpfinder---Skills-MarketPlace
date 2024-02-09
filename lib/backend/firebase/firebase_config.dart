import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB6FJJUprUetye1EaqwdwmRU6rnZTRNQCU",
            authDomain: "fit-me-0icfds.firebaseapp.com",
            projectId: "fit-me-0icfds",
            storageBucket: "fit-me-0icfds.appspot.com",
            messagingSenderId: "407116440944",
            appId: "1:407116440944:web:464ff9c2c8eb89dc649bb5"));
  } else {
    await Firebase.initializeApp();
  }
}
