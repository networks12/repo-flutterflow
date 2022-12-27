import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TiendaFirebaseUser {
  TiendaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TiendaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TiendaFirebaseUser> tiendaFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TiendaFirebaseUser>(
      (user) {
        currentUser = TiendaFirebaseUser(user);
        return currentUser!;
      },
    );
