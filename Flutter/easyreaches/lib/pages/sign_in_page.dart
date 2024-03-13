import 'package:flutter/material.dart';
//widget
import '../widgets/custom_button.dart';

//services
import '../services/navigation_services.dart';
class SignInPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }

}

class _SignInPageState extends State<SignInPage> {
  late double _deviceHeight;
  late double _deviceWidth;

  late NavigationService _navigation;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI(){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth*0.03,
          vertical: _deviceHeight*0.02,
        ),
        height: _deviceHeight*0.98,
        width: _deviceWidth*0.97,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(),
            SizedBox(
              height: _deviceHeight*0.04,
            ),
            _image(),
            SizedBox(
              height: _deviceHeight*0.05,
            ),
            _signupButtons(),
            _alreadyLogin(),
          ],
        ),
      ),
    );
  }
  Widget _pageTitle(){
    return Container(
      height: _deviceHeight*0.10,
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _image(){
    return Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/signup.png'),
        ),
      ),
    );
  }
  
  Widget _signupButtons(){
    return Container(
      height: _deviceHeight*0.35,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
              name: "Sign Up with Google",
              height: _deviceHeight*0.065,
              width: _deviceWidth*0.65,
              buttonColor: const Color.fromRGBO(0, 191, 166, 1.0),
              textColor: Colors.white,
              borderRadius: 0,
              onPressed: (){}
          ),
          SizedBox(
            height: _deviceHeight*0.05,
          ),
          CustomButton(
              name: "Sign Up with Mobile No.",
              height: _deviceHeight*0.065,
              width: _deviceWidth*0.65,
              buttonColor: const Color.fromRGBO(0, 191, 166, 1.0),
              textColor: Colors.white,
              borderRadius: 0,
              onPressed: (){}
          ),
        ],
      ),
    );
  }
  Widget _alreadyLogin(){
    return GestureDetector(
      onTap: ()=>_navigation.navigateToRoute('/login'),
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Already a user?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
            TextSpan(
              text: ' Log in',
              style: TextStyle(
                color: Color(0xFF00BFA6),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}