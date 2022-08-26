import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';
import 'OderPickDeliverScreen.dart';

class DeliverDone extends StatefulWidget {
  const DeliverDone({Key? key}) : super(key: key);

  @override
  _DeliverDoneState createState() => _DeliverDoneState();
}

class _DeliverDoneState extends State<DeliverDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.2,),
            Image.asset('images/deliver done.png'),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            Text('Order Delivered',
                style: TextStyle(fontFamily: 'poppins',fontSize: 23, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Text('Successfully!',
                style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kDeliveredDark, fontWeight: FontWeight.w500)),
            SizedBox(height: MediaQuery.of(context).size.height*.06,),
            MaterialButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OderPickDeliverScreen(isDeliver: true,)),
              );
            },
                color: AppColors.kBlueText,
              child: Text('Continue',
                  style: TextStyle(fontFamily: 'poppins',fontSize: 15, color: AppColors.kWhite, fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
