import 'package:flutter/material.dart';
import 'package:vendorapp/Screens/HomeScreen.dart';
import 'AppColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: AppColors.kWhite,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xffFCFEFF),
                  Color(0xffE7F5FD),
                  Color(0xff22A3F2),
                ],
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/Layer 1.png'),
              Text('NICTUS', style: TextStyle(fontFamily: 'poppins', fontSize: 26),),
              Text('E C O M M E R C E', style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite),),
              SizedBox(height: MediaQuery.of(context).size.height*.1,),
              Image.asset('images/midleimg.png'),
              SizedBox(height: MediaQuery.of(context).size.height*.04,),
              Text('RIDER APP', style: TextStyle(fontFamily: 'poppins',fontSize: 31, fontWeight: FontWeight.bold),),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              const Text('A reliable, easy courier experience is what \n you need to excel in today\'s marketplace',
                style: TextStyle(fontFamily: 'poppins',fontSize: 12),),
              SizedBox(height: MediaQuery.of(context).size.height*.07,),
              MaterialButton(color: Colors.white,
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()),
                        (route) => false
                );
              }, child: Text('Continue', style: TextStyle(fontFamily: 'poppins',fontSize: 13, fontWeight: FontWeight.w500, color: Colors.blue),),
              )

            ],
          ),
        ),
      ),
    );
  }
}


