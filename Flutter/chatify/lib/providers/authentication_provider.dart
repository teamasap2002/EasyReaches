//Packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
//services
import '../services/database_services.dart';
import '../services/navigation_services.dart';

//models
import '../models/chat_user.dart';
class AuthenticationProvider extends ChangeNotifier{
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseServices _databaseService;

  late ChatUser user;

  AuthenticationProvider(){
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseServices>();
    _auth.authStateChanges().listen((_user) {
      if(_user!=null){
        _databaseService.updateUserLastSeenTime(_user.uid);
        _databaseService.getUser(_user.uid).then(
                (_snapshot){
                  Map<String,dynamic>_userData=
                      _snapshot.data()! as Map<String,dynamic>;
                  user = ChatUser.fromJSON(
                    {
                      "uid": _user.uid,
                      "name": _userData["name"],
                      "email":_userData["email"],
                      "last_active": _userData["last_active"],
                      "image": _userData["image"],
                    },
                  );
                  _navigationService.removeAndNavigateToRoute('/home');
                },
        );
      } else{
        _navigationService.removeAndNavigateToRoute('/login');
      }
    });
  }

  Future<void>loginUsingEmailAndPassword(
      String _email, String _password) async{
    try{
      await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    } on FirebaseAuthException{
      print("Error login user onto Firebase");
    } catch(e){
      print(e);
    }
  }
}