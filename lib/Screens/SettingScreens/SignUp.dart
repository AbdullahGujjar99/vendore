import 'package:flutter/material.dart';
import '../../AppColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LogoutScreen.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool icon = true;
  String? name;
  String? email;
  String? password;
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
                const Text('Welcome To SignUp',
                  style: TextStyle(fontFamily: 'poppins',fontSize: 22, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                    onChanged: (value){
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Enter User Name",labelStyle: TextStyle(color: AppColors.kBlack, fontSize: 15,fontWeight: FontWeight.w600),
                      suffixIcon: Icon(Icons.person, color: AppColors.kBlueText,),
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
                    onChanged: (value){
                      setState(() {
                        email = value;
                      });
                    },
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
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
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
                        borderSide: const BorderSide(
                          color: AppColors.kBlue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: AppColors.kBlue,
                          width: 2.0,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 50,),
                MaterialButton(
                  height: 40,
                  minWidth: 265,
                  color: AppColors.kBlueText,
                  onPressed: ()async{
                    print(email);
                    print(password);
                    try {
                      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                      );
                      User? user = result.user;
                      print('user: $user');
                      user?.updateDisplayName(name);
                      print('name added');
                      //return _user(user);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut()));
                    } on FirebaseAuthException catch (e) {
                      print(e);
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut()));
                  },
                  child: Text('SignUp',
                    style: TextStyle(fontFamily: 'poppins',fontSize: 15, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                      style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kBlack, fontWeight: FontWeight.w500),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut()));
                    },
                      child: Text('LogIn',
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
