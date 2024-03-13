//packages
import 'package:easyreaches/utils/gifs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:easyreaches/firebase_options.dart';
//services
import '../services/navigation_services.dart';
import '../services/database_services.dart';
import '../services/cloud_storage_service.dart';

class SplashPage extends StatefulWidget{
  final VoidCallback onInitializationComplete;
  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }): super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage>{

  @override
  void initState(){
      super.initState();
      Future.delayed(Duration(seconds: 2)).then(
          (_){
            _setup().then(
                (_) => widget.onInitializationComplete(),
            );
          }
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EasyReaches",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Gifs.splash, width: 200,height: 200,),
              const Text(
                "Easy Reaches",
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _setup() async{
    WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     );
    _registerServices();
  }

  void _registerServices(){
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );
    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );
    GetIt.instance.registerSingleton<DatabaseServices>(
      DatabaseServices(),
    );
  }
}
