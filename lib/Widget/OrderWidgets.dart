import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../AppColors.dart';

class OrderWidgets extends StatelessWidget {
  const OrderWidgets({
    Key? key,
    required this.orderType,
    required this.darkColor,
    required this.lightColor,
    required this.onTab,
  }) : super(key: key);

  final String orderType;
  final Color darkColor;
  final Color lightColor;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.05,),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text('Luxury house decor', style: TextStyle(fontFamily: 'poppins',fontSize: 13, color: AppColors.kBlack, fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0,right: 35.0),
                        child: Row(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0,right: 35, top: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('January, 01, 2022', style: TextStyle(fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                            Text('Cash On Delivery', style: TextStyle(fontFamily: 'poppins',fontSize: 10, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )
                    ],
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
                        color: darkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text(orderType, style: TextStyle(fontFamily: 'poppins',fontSize: 10, color: AppColors.kWhite, fontWeight: FontWeight.w500))),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}