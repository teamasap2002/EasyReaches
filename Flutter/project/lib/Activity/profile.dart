import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project/Activity/edit.dart';
import 'package:project/Activity/signup.dart';
import 'package:project/services/auth.dart';
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}
FirebaseAuth _auth = FirebaseAuth.instance;
class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        cUser = event;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(0, 191, 166, 1),

        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 26, top: 20, right: 26),
            child: Column(
              children: [
                 Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: getProfileImage(),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey!",
                          style:
                          TextStyle(fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 191, 166, 1),
                              fontSize: 20),
                        ),
                        Text(
                          cUser?.displayName??"Edit your Profile",
                          style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 191, 166, 1), fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  height: 15,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                     const Icon(
                      Icons.edit,
                      size: 25,
                      color: Color.fromRGBO(0, 191, 166, 1),
                    ),
                    const SizedBox(width: 20,),
                    const Text("Edit Profile", style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 140,),

                    IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 25,
                            color: Color.fromRGBO(0, 191, 166, 1),
                          ),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                   const Icon(
                      Icons.location_on,
                      size: 25,
                      color: Color.fromRGBO(0, 191, 166, 1),
                    ),
                    const SizedBox(width: 20,),
                    const Text("Saved Address", style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 100,),
                    IconButton(
                      onPressed: (){},
                      icon:const Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: Color.fromRGBO(0, 191, 166, 1),
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Text(
                      "My Activity",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  height: 15,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.check_circle_outline,
                        size: 25,
                        color: Color.fromRGBO(0, 191, 166, 1),
                      ),
                    ),

                    const SizedBox(width: 20,),
                    const Text("Used Services", style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 100,),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Color.fromRGBO(0, 191, 166, 1),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                const Row(
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  height: 15,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildNotificationOptionRow("New for you", true),

                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: OutlinedButton(
                    child: Text("SIGN OUT", style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 191, 166, 1),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))
                    ),
                    onPressed: () {
                      signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>SignUp()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.circle_notifications,
          size: 25,
          color: Color.fromRGBO(0, 191, 166, 1),
        ),
        const SizedBox(width: 20,),
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.black),
        ),
        const SizedBox(width: 120,),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

// GestureDetector buildAccountOptionRow(BuildContext context, String title, String iconn) {
//   return GestureDetector(
//     onTap: () {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text(title),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text("Option 1"),
//                   Text("Option 2"),
//                   Text("Option 3"),
//                 ],
//               ),
//               // actions: [
//               //   FlatButton(
//               //       onPressed: () {
//               //         Navigator.of(context).pop();
//               //       },
//               //       child: Text("Close")),
//               // ],
//             );
//           });
//     },
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[600],
//             ),
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     ),
//   );

//}
}

