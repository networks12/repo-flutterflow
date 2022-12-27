import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCTIePBBBlOGXHiZkhgA8HF8Yxu4qp1sVg",
            authDomain: "tiendaoline-349c2.firebaseapp.com",
            projectId: "tiendaoline-349c2",
            storageBucket: "tiendaoline-349c2.appspot.com",
            messagingSenderId: "426258990001",
            appId: "1:426258990001:web:c2e0e1845226d6d8143390",
            measurementId: "G-4MKB16FSKV"));
  } else {
    await Firebase.initializeApp();
  }
}
