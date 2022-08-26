import 'package:flutter/material.dart';
import 'package:vendorapp/AppColors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool icon = true;
  bool icon2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.klightBlue,
      ),
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
                Text('Change Password',
                  style: TextStyle(fontFamily: 'poppins',fontSize: 22, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
            TextFormField(
              obscureText: icon2,
                decoration: InputDecoration(
                  labelText: "Old Password",labelStyle: TextStyle(color: AppColors.klightBlue, fontSize: 15,fontWeight: FontWeight.w600),
                  suffixIcon: IconButton(icon: Icon(icon2== true? Icons.remove_red_eye: Icons.visibility_off, color: Colors.grey,),
                    onPressed: () {
                      setState(() {
                        icon2== true? icon2=false: icon2=true;
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
                SizedBox(height: 10,),
                TextFormField(
                    obscureText: icon,
                    decoration: InputDecoration(
                      labelText: "New Password",labelStyle: TextStyle(color: AppColors.klightBlue, fontSize: 15,fontWeight: FontWeight.w600),
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
                  onPressed: (){},
                  child: Text('Update',
                    style: TextStyle(fontFamily: 'poppins',fontSize: 15, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
