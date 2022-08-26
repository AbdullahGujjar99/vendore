import 'package:flutter/material.dart';

import '../../AppColors.dart';
import '../ChatScreen/Chat.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kBlueText,
        ),
        elevation: 0,
        backgroundColor: AppColors.kWhite,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset("images/Virtual office .png"),
              const SizedBox(height: 20,),
              const Text('Help Center',
                style: TextStyle(fontFamily: 'poppins',fontSize: 22, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Chat()));
                },
                child: Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width*.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kBlueText, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.message_outlined, color: AppColors.kBlueText,),
                        SizedBox(width: 20,),
                        Text('Live Chat',
                          style: TextStyle(fontFamily: 'poppins',fontSize: 16, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120,),
              const Text('Or Email Us At',
                style: TextStyle(fontFamily: 'poppins',fontSize: 16, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
              Container(
                height: 64,
                width: MediaQuery.of(context).size.width*.5,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kBlueText, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text('support@nictus.com',
                    style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kBlueText, fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
