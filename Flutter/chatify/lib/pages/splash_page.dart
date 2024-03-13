import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//services
import '../services/navigation_services.dart';
import '../services/media_service.dart';
import '../services/cloud_storage_service.dart';
import '../services/database_services.dart';
class SplashPage extends StatefulWidget{
  final VoidCallback onInitializationComplete;
  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
            (_) {
              _setup().then(
                    (_) => widget.onInitializationComplete(),
              );
           },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chaitfy",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              const Text("Chatify",
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ) ,),
    );
  }
  Future<void> _setup() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices(){
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );
    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );
    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );
    GetIt.instance.registerSingleton<DatabaseServices>(
      DatabaseServices(),
    );
  }
}