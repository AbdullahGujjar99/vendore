import 'package:flutter/material.dart';
import '../AppColors.dart';

class PendingScreenDetailWidget extends StatelessWidget {
  PendingScreenDetailWidget({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.85,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.kPendingLight,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
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
                Visibility(
                    visible: !isVisible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        TextButton(onPressed: (){}, child: Text('View On Map',
                            style: TextStyle(decoration: TextDecoration.underline,decorationColor: AppColors.kBlueText,
                                shadows: [Shadow(offset: Offset(0, -5), color: AppColors.kBlueText)],
                                fontFamily: 'poppins',fontSize: 12, color: Colors.transparent, fontWeight: FontWeight.w500)),)
                        ],
                    )
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.04,),
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
                Visibility(
                    visible: !isVisible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        TextButton(onPressed: (){}, child: Text('View On Map',
                            style: TextStyle(decoration: TextDecoration.underline,decorationColor: AppColors.kBlueText,
                                shadows: [Shadow(offset: Offset(0, -5), color: AppColors.kBlueText)],
                                fontFamily: 'poppins',fontSize: 12, color: Colors.transparent, fontWeight: FontWeight.w500)),)
                      ],
                    )
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
                color: AppColors.kPendingDark,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(child: Text('Pending', style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kWhite, fontWeight: FontWeight.w500))),
            ),
          ),
        ),
      ],
    );
  }
}