import 'package:flutter/material.dart';
import 'package:project/Activity/profile.dart';
import 'package:project/navigation_menu.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        // preferredSize: Size.fromHeight(0),
        AppBar(
          backgroundColor: Color.fromRGBO(0, 191, 166, 1),
        ),

      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 26, top: 10, right: 26),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                      SizedBox(height: 10,),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              //color: Theme.of(context).scaffoldBackgroundColor
                            color: Color.fromRGBO(0, 191, 166, 1),
                          ),
                          boxShadow:[
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.3),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage("https://images.app.goo.gl/3xxmyJJ2GUkc6scT7"),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 30,
                            width: 30,

                            child: Icon(Icons.edit, color:Colors.black),
                              decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                     color: Color.fromRGBO(0, 191, 166, 1),
                          ),
                          ),
                      ),
                    ],
                  ),
                  //Text("Name", style: TextStyle(color: HexColor("#00BFA6"),fontWeight: FontWeight.bold, fontSize: 20),),
                  TextField(
                      cursorColor: Color.fromRGBO(0, 191, 166, 1),
                    decoration: InputDecoration(
                        focusedBorder:UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 191, 166, 1))
                        ),
                      labelText: "Name",
                        labelStyle: TextStyle(color: Color.fromRGBO(0, 191, 166, 1),fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                      cursorColor: Color.fromRGBO(0, 191, 166, 1),
                    decoration: InputDecoration(
                        focusedBorder:UnderlineInputBorder(
                            borderSide: BorderSide(color:Color.fromRGBO(0, 191, 166, 1))
                        ),
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Color.fromRGBO(0, 191, 166, 1),fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    style: TextStyle(color: Colors.black,fontSize: 18),
                    textAlign: TextAlign.start,
                    showCursor: true,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    cursorColor: Color.fromRGBO(0, 191, 166, 1),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder:UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 191, 166, 1))
                        ),
                      labelText: "Mobile no.",
                        labelStyle: TextStyle(color: Color.fromRGBO(0, 191, 166, 1),fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    style: TextStyle(color: Colors.black,fontSize: 18),
                    textAlign: TextAlign.start,
                    showCursor: true,
                    maxLength: 10,
                  ),
                  SizedBox(height: 5,),
                  TextField(
                      cursorColor: Color.fromRGBO(0, 191, 166, 1),
                    decoration: InputDecoration(
                      focusedBorder:UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(0, 191, 166, 1))
                      ),
                      labelText: "Email id",
                        labelStyle: TextStyle(color: Color.fromRGBO(0, 191, 166, 1),fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    style: TextStyle(color: Colors.black,fontSize: 18),
                    textAlign: TextAlign.start,
                    showCursor: true,
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: OutlinedButton(
                      child: Text("SAVE", style: TextStyle(
                          fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)))
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 250),
              ],
            ),
          ),
              ),
        ),
      ),
    );
  }
}
