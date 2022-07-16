import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VitrineAgroFirebaseUser {
  VitrineAgroFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

VitrineAgroFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VitrineAgroFirebaseUser> vitrineAgroFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VitrineAgroFirebaseUser>(
        (user) => currentUser = VitrineAgroFirebaseUser(user));
