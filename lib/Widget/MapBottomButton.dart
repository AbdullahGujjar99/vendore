import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendorapp/Widget/MapDetailWidget.dart';

import '../AppColors.dart';
import '../Screens/DeliverDone.dart';
import '../Screens/OderPickDeliverScreen.dart';
import 'BottomButton.dart';

class MapBottomButton extends StatefulWidget {
  MapBottomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onpress,
    required this.isVisible,

  }) : super(key: key);

  final String text;
  final Color color;
  final Function() onpress;
  final bool isVisible;

  @override
  State<MapBottomButton> createState() => _MapBottomButtonState();
}

class _MapBottomButtonState extends State<MapBottomButton> {
  bool value = false;
  Color? textColor;
  Color buttonColor = AppColors.kDeliveredlight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 63.0),
      child: Container(
        height: 64,
        width: 251,
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (widget.isVisible == true) {
                showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                              ),
                              Text(
                                'Confirm Pickup?',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 23,
                                    color: AppColors.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Of Following Order',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    color: AppColors.kBlueText,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                              ),
                              MapDetailWidget(
                                color: AppColors.klightBlue,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .1,
                              ),
                              BottomButton(
                                text: 'Yes Confirm Pickup',
                                ontab: () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      ),
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .6,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .05,
                                                ),
                                                Image.asset(
                                                    'images/deliv (1).png'),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02,
                                                ),
                                                Text('Order Picked Up',
                                                    style: TextStyle(
                                                        fontFamily: 'poppins',
                                                        fontSize: 23,
                                                        color: AppColors.kBlack,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  height: 17,
                                                ),
                                                Text('Successfully!',
                                                    style: TextStyle(
                                                        fontFamily: 'poppins',
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .kDeliveredDark,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .05,
                                                ),
                                                MaterialButton(
                                                  onPressed: widget.onpress,
                                                  color: Colors.blue,
                                                  child: Text(
                                                    'Continue',
                                                    style: TextStyle(
                                                        fontFamily: 'poppins',
                                                        fontSize: 15,
                                                        color: AppColors.kWhite,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                color: AppColors.kBlueText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              else {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  builder: (BuildContext context) {
                    return Wrap(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .93,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                const Text(
                                  'Confirm Drop off?',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 23,
                                      color: AppColors.kBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Of Following Order',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: AppColors.kBlueText,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * .22,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.kLightWhite,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                        ),
                                        const Text('Luxury house decor',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontSize: 13,
                                                color: AppColors.kWhite,
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: const [
                                                Text('Order No #',
                                                    style: TextStyle(
                                                        fontFamily: 'poppins',
                                                        fontSize: 12,
                                                        color: AppColors.kWhite,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text('N21255',
                                                    style: TextStyle(
                                                        fontFamily: 'poppins',
                                                        fontSize: 12,
                                                        color:
                                                            AppColors.kWhite,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                            const Text('\$250',
                                                style: TextStyle(
                                                    fontFamily: 'poppins',
                                                    fontSize: 18,
                                                    color: AppColors.kWhite,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text('January, 01, 2022',
                                                  style: TextStyle(
                                                      fontFamily: 'poppins',
                                                      fontSize: 10,
                                                      color:
                                                          AppColors.kWhite,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text('Cash On Delivery',
                                                  style: TextStyle(
                                                      fontFamily: 'poppins',
                                                      fontSize: 10,
                                                      color:
                                                          AppColors.kWhite,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text('Address',
                                                style: TextStyle(
                                                    fontFamily: 'poppins',
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.kWhite,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                                '658 Ashley Street \n Midletown, CT 06457',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 12,
                                                  color: AppColors.kWhite,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * .03,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * .22,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.klightBlue,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
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
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * .03,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * .14,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.klightBlue,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                                        const Text('Did You Collect The Amount?',
                                            style: TextStyle(
                                                fontFamily: 'poppins',fontSize: 13, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('\$250', style:
                                            TextStyle(fontFamily: 'poppins',fontSize: 18, color: textColor, fontWeight: FontWeight.w600)),
                                            Checkbox(
                                              activeColor: AppColors.kDeliveredDark,
                                              value: this.value,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  print(this.value);
                                                  this.value = value!;
                                                  this.value == false? textColor = AppColors.kBlueText: textColor = AppColors.kDeliveredDark;
                                                  this.value == false? buttonColor= AppColors.kDeliveredlight: buttonColor = AppColors.kDeliveredDark;
                                                });},

                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                BottomButton(
                                  text: 'Yes Confirm Pickup',
                                  ontab: () {
                                    if(value == true){
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => DeliverDone()),
                                              (route) => false
                                      );
                                    }
                                  },
                                  color: buttonColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Container(
              height: 40,
              width: 227,
              color: widget.color,
              child: Center(
                child: Text(widget.text,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        color: AppColors.kWhite,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
