import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//sign in
bool isLogin = false;
User? cUser;
Future<void> checkLogin()async {
  _auth.authStateChanges().listen((User? user) {
    if(user !=null){
      isLogin = true;
    }
  });
}

getProfileImage(){
  if(_auth.currentUser?.photoURL!=null){
    return Image.network(_auth.currentUser!.photoURL.toString(), fit: BoxFit.cover,);
  } else{
    return const Icon(Icons.account_circle_rounded, size: 70,);
  }
}
Future<User?> signInWithGoogle() async{
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
  );

  final userCredential = await _auth.signInWithCredential(credential);

  final User? user = userCredential.user;

  assert(!user!.isAnonymous);
  assert(await user!.getIdToken()!=null);

  final User? currentUser = await _auth.currentUser;

  assert(currentUser!.uid == user?.uid);
  print(user);
  return user;
}

void signOut() async
{
  await googleSignIn.signOut();
  await _auth.signOut();
}