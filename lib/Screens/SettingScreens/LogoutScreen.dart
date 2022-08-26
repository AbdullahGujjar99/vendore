import 'package:flutter/material.dart';

import '../../AppColors.dart';
import '../HomeScreen.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  bool icon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.klightBlue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("images/sapiens.png"),
                SizedBox(height: 40,),
                Text('Welcome Back 😃',
                  style: TextStyle(fontFamily: 'poppins',fontSize: 22, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Email",labelStyle: TextStyle(color: AppColors.kBlack, fontSize: 15,fontWeight: FontWeight.w600),
                      suffixIcon: Icon(Icons.email, color: AppColors.kBlueText,),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: AppColors.kBlue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: AppColors.kBlue,
                          width: 2.0,
                        ),
                      ),
                    )
                ),
                SizedBox(height: 10,),
                TextFormField(
                    obscureText: icon,
                    decoration: InputDecoration(
                      labelText: "Password",labelStyle: TextStyle(color: AppColors.klightBlue, fontSize: 15,fontWeight: FontWeight.w600),
                      suffixIcon: IconButton(icon: Icon(icon== true? Icons.remove_red_eye: Icons.visibility_off, color: Colors.grey,),
                        onPressed: () {
                          setState(() {
                            icon== true? icon=false: icon=true;
                          });
                        },),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: AppColors.kBlue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: AppColors.kBlue,
                          width: 2.0,
                        ),
                      ),
                    )
                ),
                SizedBox(height: 50,),
                MaterialButton(
                  height: 40,
                  minWidth: 265,
                  color: AppColors.kBlueText,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Text('Login',
                    style: TextStyle(fontFamily: 'poppins',fontSize: 15, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                      style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kBlack, fontWeight: FontWeight.w500),),
                    TextButton(onPressed: (){},
                      child: Text('SignUp',
                      style: TextStyle(fontFamily: 'poppins',fontSize: 14, fontWeight: FontWeight.w500),),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
