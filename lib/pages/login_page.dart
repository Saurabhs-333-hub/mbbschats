import 'package:flutter/material.dart';
import 'package:mbbschats/component/bottom_navigation_bar.dart';
import 'package:mbbschats/component/dimension.dart';
import 'package:mbbschats/widgets/custom_button.dart';
import 'package:mbbschats/widgets/custom_textfield.dart';
import 'package:mbbschats/widgets/customrich_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SC.fromHeight(10),),
                  // LOGO //
                  Center(
                    child: Container(
                      width: SC.fromWidth(3),
                      // height: SC.fromHeight(10),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  SizedBox(height: SC.fromHeight(10),),

                  Center(child: Text('Welcome!',style: TextStyle(fontSize: SC.fromWidth(16),fontWeight: FontWeight.w600),)),
                  Center(child: Text('Log in to continue',style: TextStyle(color: Color(0xFFFB1B1B1),fontSize: SC.fromWidth(23),),)),


                  SizedBox(height: 15,),

                  // USER NAME TEXT FIELD //
                  Text('Email or Username',style: TextStyle(fontSize: SC.fromWidth(24)),),
                  SizedBox(height: SC.fromHeight(120),),
                  CustomTextField(
                    controller: textEditingController,

                    hintText: 'Your Email or Username Here  ',
                  ),



                  SizedBox(height: SC.fromHeight(50),),
                  // PASSWORD TEXT FIELD //
                  Text('Password',style: TextStyle(fontSize: SC.fromWidth(24)),),
                  SizedBox(height: SC.fromHeight(120),),
                  CustomTextField(
                    controller: textEditingController,

                    hintText: 'Type your Password',
                  ),


                  SizedBox(height: SC.fromHeight(50),),
                  Row(

                    children: [
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                          },
                          child: Text('Forgot Password ?',style: TextStyle(fontSize: SC.fromWidth(25),color: Color(0xFFF0437E9)),)),
                    ],),

                  SizedBox(height: SC.fromHeight(22),),
                  CustomButton(text: 'Login In', onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBottomNavigationBar()));

                  },),

                  SizedBox(height: SC.fromHeight(8),),
                  Center(
                    child: CustomRichText(
                      text: 'Don’t have an account ?',
                      clickableText: ' Sign Up',
                      fontSize: SC.fromWidth(27), // Pass the font size
                      onTap: () {

                      },
                    ),
                  ),

                  SizedBox(height: SC.fromHeight(22),),
                ],
              ),
            ),
          )
      ),
    );
  }
}
