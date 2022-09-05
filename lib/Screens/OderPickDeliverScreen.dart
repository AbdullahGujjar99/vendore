import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendorapp/AppColors.dart';

import '../Widget/BottomButton.dart';
import '../Widget/OrderWidgets.dart';
import '../Widget/PendingDetailWidget.dart';
import '../Widget/PendingTopButtonWidget.dart';
import 'PickUpMap.dart';

class OderPickDeliverScreen extends StatefulWidget {
  bool isDeliver;
  OderPickDeliverScreen({Key? key, required this.isDeliver,}) : super(key: key);

  @override
  _OderPickDeliverScreenState createState() => _OderPickDeliverScreenState(isDeliver);
}

class _OderPickDeliverScreenState extends State<OderPickDeliverScreen> {
  bool isDeliver;
  _OderPickDeliverScreenState(this.isDeliver);
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
                    Row(
                      children: [
                        Visibility(visible: isDeliver==false,
                            child: Container(
                          height: 28,
                          width: 116,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: AppColors.kBlueText,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.check,color: AppColors.kBlueText, size: 16,),
                                Text('Picked up',
                                  style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kBlueText, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        )),
                        Visibility(visible: isDeliver==true,
                            child: Container(
                              height: 28,
                              width: 116,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.kDeliveredDark,
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check,color: AppColors.kDeliveredDark, size: 16,),
                                    Text('Delivered',
                                      style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kDeliveredDark, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ))
                      ],
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 35),
                        child: Text('Order Detail',
                            style: TextStyle(fontFamily: 'poppins',fontSize: 18, color: AppColors.kBlack, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 26,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20,),
                    child: OrderPickDeliverScreenWidget(isDliever: isDeliver,),
                  ),
                      //PendingScreenDetailWidget(isVisible: isVisible,),
                      Container(
                        padding: const EdgeInsets.only(left: 25.0, right: 25),
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
                                Visibility(visible:  isDeliver == false,
                                    child: Image.asset('images/deli2.png')),
                                Visibility(visible: isDeliver == true,
                                    child: Image.asset('images/delidone.png')),

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
                      ),
                      SizedBox(height: 34,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20,),
                        child: Text('Products',
                            style: TextStyle(
                                fontFamily: 'poppins',fontSize: 18, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.6,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20,),
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
                                padding: const EdgeInsets.only(left: 20.0, right: 20,),
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
                                            child: Center(
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
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '\$250.00',
                                                style: new TextStyle(
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
                                        SizedBox(height: 17,),
                                        Text('x2',
                                          style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.bold),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Visibility(visible: isDeliver== false,
                                child: BottomButton(text: 'Confirm Drop Off', color: AppColors.kBlueText, ontab: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PickUpMap(isVisible: false, text: 'Confirm Drop Off',
                                      color: AppColors.kDeliveredDark, appbar: 'Drop Off Address',
                                    )),
                                  );
                                },),
                              ),
                              // Visibility(
                              //   visible: !isVisible,
                              //  above button add here later
                              // ),
                            ],
                          ),
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

class OrderPickDeliverScreenWidget extends StatelessWidget {
  OrderPickDeliverScreenWidget({
    Key? key,
    required this.isDliever,
  }) : super(key: key);
  bool isDliever;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: isDliever== false? AppColors.klightBlue: AppColors.kDeliveredlight,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                Visibility(visible: isDliever == true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Luxury house decor', style: TextStyle(fontFamily: 'poppins',fontSize: 13, color: AppColors.kBlack, fontWeight: FontWeight.w700)),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Order No #', style: TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlack, fontWeight: FontWeight.w500)),
                            Text('N21255', style: TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlueText, fontWeight: FontWeight.w500)),

                          ],
                        ),
                        Text('\$250',
                            style: TextStyle(fontFamily: 'poppins',fontSize: 18, color: AppColors.kBlueText, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('January, 01, 2022', style: TextStyle(fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                          Text('Cash On Delivery',
                              style: TextStyle(
                                  fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),

                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 15,),
                const Text('Customer Info',
                    style: TextStyle(
                        fontFamily: 'poppins',fontSize: 13, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Name', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w600)),
                    Text('John Doe',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Phone #', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w600)),
                    Text('+001-123456-21',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Address', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w600)),
                    Text('658 Ashley Street \n Midletown, CT 06457', textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w500,)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                Visibility(visible: isDliever == false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MidButtonWidget(text: 'Phone Call', img: 'images/phone.png',),
                      MidButtonWidget(text: 'View On Map', img: 'images/location.png',),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.04,),
                const Text('Billing',
                    style: TextStyle(
                        fontFamily: 'poppins',fontSize: 13, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w600)),
                    Text('\$250',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Discount', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w600)),
                    Text('\$25',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Delivery Charges', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w600)),
                    Text('\$25', textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightWhite, fontWeight: FontWeight.w500,)),
                  ],
                ),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total', style:
                    TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlueText, fontWeight: FontWeight.w600)),
                    Text('\$250', textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlueText, fontWeight: FontWeight.w500,)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -10,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Container(
              height: MediaQuery.of(context).size.height*.03,
              width: MediaQuery.of(context).size.width*.2,
              decoration: BoxDecoration(
                color: isDliever== false? AppColors.kBlue: AppColors.kDeliveredDark,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(child: Text(isDliever== false? 'On The Way': 'DELIVERED', style: TextStyle(fontFamily: 'poppins',fontSize: 10, color: AppColors.kWhite, fontWeight: FontWeight.w500))),
            ),
          ),
        ),
      ],
    );
  }
}

class MidButtonWidget extends StatelessWidget {
  const MidButtonWidget({
    Key? key,
    required this.text,
    required this.img,
  }) : super(key: key);
  final String text;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Container(
            height: 32,
            width: 130,
            decoration: BoxDecoration(
                border: Border.all(
                  //width: 10,
                  color: AppColors.kBlueText,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('$img'),
                  Text(text,
                    style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kBlueText, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
