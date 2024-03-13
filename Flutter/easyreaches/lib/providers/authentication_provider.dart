//Packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//services
import '../services/database_services.dart';
import '../services/navigation_services.dart';

//models
import '../models/service_user.dart';

class AuthenticationProvider extends ChangeNotifier{
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseServices _databaseServices;

  late ServiceUser user;

  AuthenticationProvider(){
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseServices = GetIt.instance.get<DatabaseServices>();
    _auth.authStateChanges().listen((_user) {
      if(_user!=null){
        _databaseServices.getUser(_user.uid).then(
                (_snapshot){
                  Map<String,dynamic>_userData =
                      _snapshot.data()! as Map<String,dynamic>;
                  user = ServiceUser.fromJSON({
                    "uid": _user.uid,
                    "name":_userData["name"],
                    "email": _userData["email"],
                    "image":_userData["image"],
                    "mobile":_userData["mobile"],
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
      print("Error login user into Firebase");
    } catch(e){
      print(e);
    }
  }
}