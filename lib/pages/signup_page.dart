import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbbschats/component/dimension.dart';
import 'package:mbbschats/pages/login_page.dart';
import 'package:mbbschats/widgets/custom_button.dart';
import 'package:mbbschats/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(SC.fromHeight(6)), // Adjust height as needed
            child:const  Center()

        ),
        automaticallyImplyLeading: false, // Ensures the back button is visible by default

        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(

          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        flexibleSpace: Container(
          child: Center(child: Image.asset('assets/logo.png',width:200,)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x88115C8E), Color(0x88F4829D)
              ], // Adjust colors as needed
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: SC.fromHeight(20),),

                Text('Welcome!',style: TextStyle(fontSize: SC.fromWidth(16),fontWeight: FontWeight.w600),),
                Text('Sign up or Log in to continue',style: TextStyle(color: Color(0xFFFB1B1B1),fontSize: SC.fromContextWidth(context,25),fontWeight: FontWeight.w500),),


                // COUNTINUE WITH GOOGLE //
                SizedBox(height: 18,),
                Container(
                  width: double.infinity,
                  height: SC.fromHeight(17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                    color: Colors.grey.shade400
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/img_1.png'),
                      ),
                      SizedBox(width: 5,),
                      Text('Countinue with Google',style: TextStyle(color: Colors.grey.shade700,fontSize: SC.fromWidth(25)),)
                    ],
                  ),
                ),


                SizedBox(height: 18,),
                // DIVIDER //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: SC.fromContextWidth(context,2.7),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),

                    Text('Or',style: TextStyle(color: Colors.grey.shade400,fontSize: SC.fromWidth(22),fontWeight: FontWeight.w500),),
                    Container(
                      width: SC.fromContextWidth(context,2.7),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                // USER NAME TEXT FIELD //
                Text('Work Email',style: TextStyle(fontSize: SC.fromWidth(24)),),
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
                CustomButton(text: 'Countinue', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                },),
                SizedBox(height: SC.fromHeight(22),),
                Center(child: Text('Lets get started....',style: TextStyle(color: Colors.grey,fontSize: SC.fromWidth(24)),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

