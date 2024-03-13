//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

const String USER_COLLECTIONS = "Users";

class DatabaseServices{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseServices(){}

  Future<DocumentSnapshot>getUser(String _uid){
    return _db.collection(USER_COLLECTIONS).doc(_uid).get();
  }

}