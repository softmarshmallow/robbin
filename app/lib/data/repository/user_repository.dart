import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'repository.dart';

class FirebaseAuthRepository {
  static IdTokenResult tokenResult;

  static String get token {
    return tokenResult?.token ?? null;
  }
}

class UserRepository extends BaseRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isSignedIn = false;

  Future<bool> isSignedIn() async {
    // explicit execution order
    if (_isSignedIn) {
      return true;
    }
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
    // explicit execution order
  }

  startRefreshTokenTimer() {
    const duration = const Duration(seconds: 10);
    new Timer.periodic(duration, (Timer t) async {
      refreshToken();
    });
  }

  Future<String> refreshToken() async {
    if (FirebaseAuthRepository.tokenResult?.expirationTime != null &&
        FirebaseAuthRepository.tokenResult.expirationTime
            .isAfter(DateTime.now())) {
      return FirebaseAuthRepository.token;
    }

    // if expired, refresh token
    FirebaseAuthRepository.tokenResult =
        (await (await _firebaseAuth.currentUser()).getIdToken(refresh: true));

    return FirebaseAuthRepository.token;
  }

  bool _isSessionInitiallyLoggedIn = false;

  UserRepository() {
    _firebaseAuth.onAuthStateChanged.listen((fUser) {
      if (fUser != null) {
        if (!_isSessionInitiallyLoggedIn) {
          _isSessionInitiallyLoggedIn = true;
          startRefreshTokenTimer();
          onFirebaseSignIn();
        }
        refreshToken();
      }
    });
  }

  onFirebaseSignIn() {
    _isSignedIn = true;
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResult> signInWithCustomToken(String customToken) async {
    return _firebaseAuth.signInWithCustomToken(token: customToken);
  }

  Future<AuthResult> signInAnonymously() async {
    return _firebaseAuth.signInAnonymously();
  }

  Future<void> signUpWithEmail({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<FirebaseUser> getFirebaseUser() async {
    return await _firebaseAuth.currentUser();
  }
}
