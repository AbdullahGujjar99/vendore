
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../AppColors.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  _EarningScreenState createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  List<String> amount = ["\$150.0","\$150.0","\$150.0","\$150.0"];
  List<String> credit = ["Credit Card","PayPal","PayPal","Credit Card"];
  List<String> date = ["25/06/2021","25/06/2021","25/06/2021","25/06/2021"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kWhite,
        ),
        elevation: 0,
        backgroundColor: AppColors.kBlueText,
        actions: <Widget>[
          Icon(Icons.notifications_none_outlined, color: AppColors.kWhite,), //IconButton
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height:  MediaQuery.of(context).size.height*.25,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transactions',
                        style: TextStyle(fontFamily: 'poppins', fontSize: 18, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                      Container(decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.kLightBlackOPC,
                        )
                      ),
                        height: MediaQuery.of(context).size.height*.03,
                        width: 102,
                        child: Padding(
                          padding: const EdgeInsets.only(left:3.0, right: 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.calendar_today_outlined, color: AppColors.kBlueText,size: 15,),
                              Text('25/06/2022', style:
                              TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlueText, fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(top: 200,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder
                (
                  itemCount: amount.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(height: 74,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(5),),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                //offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('images/earning.png'),
                                SizedBox(width: 19,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(amount[index], style:
                                    TextStyle(fontFamily: 'poppins',fontSize: 16, color: AppColors.kBlueText, fontWeight: FontWeight.bold),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(credit[index], style:
                                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlackOpaque, fontWeight: FontWeight.w600),),
                                    SizedBox(width:  MediaQuery.of(context).size.width*.4,),
                                    Text(date[index], style:
                                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlackOpaque, fontWeight: FontWeight.w600),),
                                  ],
                                ),
                                  ],
                                ),
                                //Text(litems[index]),
                              ],
                            ),
                          )),
                    );
                  }
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*.2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.kBlueText,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                ),
            child: Center(
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width*.8,
                color: Colors.white,
                child: Column(
                  children: [
                    Text('Available Balance',
                      style: TextStyle(fontFamily: 'poppins', fontSize: 23, color: AppColors.kBlueText, fontWeight: FontWeight.bold),),
                    Text('\$200.00',
                      style: TextStyle(fontFamily: 'poppins', fontSize: 23, color: AppColors.kDeliveredDark, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
