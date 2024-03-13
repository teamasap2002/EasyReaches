import 'dart:async';

class ServiceUser{
  final String uid;
  final String name;
  final String email;
  final String imageURL;
  final String mobileNo;

  ServiceUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageURL,
    required this.mobileNo,
});

  factory ServiceUser.fromJSON(Map<String,dynamic>_json){
    return ServiceUser(
        uid: _json["uid"],
        name: _json["name"],
        email: _json["email"],
        imageURL: _json["image"],
        mobileNo: _json["mobile"],
    );
  }

  Map<String,dynamic>toMap(){
    return{
      "email":email,
      "name":name,
      "image":imageURL,
      "mobile":mobileNo,
    };
  }
}