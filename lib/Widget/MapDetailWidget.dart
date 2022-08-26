import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

class MapDetailWidget extends StatelessWidget {
  MapDetailWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
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
    );
  }
}