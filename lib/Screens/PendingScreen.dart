import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendorapp/AppColors.dart';

import '../Widget/BottomButton.dart';
import '../Widget/PendingDetailWidget.dart';
import '../Widget/PendingTopButtonWidget.dart';
import 'PickUpMap.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  _PendingScreenState createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  bool isVisible = true;
  bool Visible = true;
  bool button = true;

  void showToast() {
    setState(() {
      isVisible = !isVisible;
      button = true;
      Navigator.pop(context);
    });
  }
  void showToast2() {
    setState(() {
      Visible = !Visible;
      button = false;
      Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView( headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          backgroundColor: AppColors.klightBlue,
          elevation: 0,
          pinned: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height*.09,

          flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: SafeArea(child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*.42,),
                    Visibility(
                      visible: button==false ? Visible : isVisible,
                      child: Row(
                        children: [
                          PendingTopButton(
                            color: AppColors.kRed, text: 'Reject',message: 'Reject This Order # N12222', img: 'images/rejectimg.png', height: 20,
                            img2: 'images/reject2.png', msg1: 'Order Rejected',msg2: 'Order # N12222 Rejected Successfully',
                            onpress: showToast2,
                          ),
                          SizedBox(width: 9,),
                          PendingTopButton(
                            color: AppColors.kDeliveredDark, text: 'Accept',message: 'Accept This Order # N12222', img: 'images/acceptimg.png',
                            height: 35, img2: 'images/accept2.png',msg1: 'Order Accepted', msg2: 'Order # N12222 Accepted Successfully',
                            onpress: showToast,
                          ),
                        ],
                      )
                    ),
                    Visibility(
                        visible: !isVisible,
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 116,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.kDeliveredDark,
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.check,color: AppColors.kDeliveredDark,),
                                  Text('Accepted',
                                    style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kDeliveredDark, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                    Visibility(
                        visible: !Visible,
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 116,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.kRed,
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.clear_rounded,color: AppColors.kRed,),
                                  Text('Rejected',
                                    style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kRed, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),),
          ),
          leading: IconButton(onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          }, icon: Image.asset('images/arrow.png'),),
        ),


      ];
    },
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*(1/2),
            width: MediaQuery.of(context).size.width,
            color: AppColors.klightBlue,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*.04,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Text('Order Detail',
                          style: TextStyle(fontFamily: 'poppins',fontSize: 13, color: AppColors.kBlack, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 26,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: PendingScreenDetailWidget(isVisible: isVisible,),
                    ),
                    Visibility(
                        visible: !isVisible,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          height: 300,
                          width: MediaQuery.of(context).size.width,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 34,),
                              Text('Delivery Status',
                                  style: TextStyle(
                                      fontFamily: 'poppins',fontSize: 18, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/delivery.png'),
                                  Image.asset('images/deli2.png'),

                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('Waiting Delivery',
                                      style: TextStyle(
                                          fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                                      Text('Rider Is Delivering Package',
                                          style: TextStyle(
                                              fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                                      SizedBox(height: 25,),
                                      Text('Ready To Ship',
                                          style: TextStyle(
                                              fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                                      Text('Seller Is Preparing Package',
                                          style: TextStyle(
                                              fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                                      SizedBox(height: 25,),
                                      Text('Packaging',
                                          style: TextStyle(
                                              fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                                      Text('Seller Is Preparing Package',
                                          style: TextStyle(
                                              fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                                    ]
                                  )

                                ],
                              )
                              ],
                          ),
                        )
                    ),
                    SizedBox(height: 34,),
                    Text('    Products',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 18, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                    Container(
                      //padding: const EdgeInsets.only(left: 20.0, right: 20),
                      height: MediaQuery.of(context).size.height*.6,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 143,
                                  width: 126,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/bg.png"), fit: BoxFit.cover)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Container(
                                  height: 22,
                              width: 57,
                              color: AppColors.kBlueText,
                              child: Center(
                                child: Text('New',
                                  style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                              ),
                            ),
                                      Image.asset('images/heart.png'),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Modern ladies casual \nbag',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.bold),),
                                    RichText(text: const TextSpan(
                                      text: '★★★★★ ',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 16, color: AppColors.kStarColor, fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(text: ' (150)',
                                          style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.klightBlack, fontWeight: FontWeight.bold),)
                                      ]
                                    )),
                                    Text('\$150.00',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.kBlueText, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 17,),
                                    Text('x2',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 17,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 143,
                                  width: 126,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/chair.png"), fit: BoxFit.cover)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 22,
                                            width: 57,
                                            color: AppColors.kBlueText,
                                            child: Center(
                                              child: Text('New',
                                                style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                          Image.asset('images/heart.png'),
                                        ],
                                      ),
                                      SizedBox(height: 9,),
                                      Container(
                                        height: 22,
                                        width: 57,
                                        color: AppColors.kDeliveredDark,
                                        child: const Center(
                                          child: Text('On Sale',
                                            style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Modern lounge chair',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.bold),),
                                    RichText(text: const TextSpan(
                                        text: '★★★★★ ',
                                        style: TextStyle(fontFamily: 'poppins', fontSize: 16, color: AppColors.kStarColor, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(text: ' (150)',
                                            style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.klightBlack, fontWeight: FontWeight.bold),)
                                        ]
                                    )),
                                    RichText(
                                      text: const TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '\$250.00',
                                            style: TextStyle(
                                              fontFamily: 'poppins', fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '  \$150.00',
                                            style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.kBlueText, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 17,),
                                    Text('x2',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Visibility(
                              visible: !isVisible,
                              child: BottomButton(text: 'Confirm Pickup', color: AppColors.kBlueText, ontab: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PickUpMap(isVisible: true, text: 'Confirm Drop',
                                    color: AppColors.kBlueText, appbar: 'Pickup Address',)),
                                );
                              },),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
        ),
    );
  }
}





