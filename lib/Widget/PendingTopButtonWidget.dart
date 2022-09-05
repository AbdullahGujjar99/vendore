import 'package:flutter/material.dart';
import '../AppColors.dart';
import '../Screens/PendingScreen.dart';

class PendingTopButton extends StatelessWidget {
  PendingTopButton({
    Key? key,
    required this.text,
    required this.color,
    required this.message,
    required this.img,
    required this.height,
    required this.img2,
    required this.msg1,
    required this.msg2,
    required this.onpress,
  }) : super(key: key);

  final String text;
  final Color color;
  final String message;
  final String img;
  final String img2;
  final double height;
  final String msg1;
  final String msg2;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            builder: (BuildContext context){
              return SizedBox(
                height: MediaQuery.of(context).size.height*.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: height,),
                    Image.asset('$img'),
                    SizedBox(height: 17,),
                    Text('Do you want to',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 23, color: AppColors.kLightWhite, fontWeight: FontWeight.bold)),
                    //SizedBox(height: 17,),
                    Text('$message',
                        style: TextStyle(
                            fontFamily: 'poppins',fontSize: 14, color: color, fontWeight: FontWeight.w600)),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        //SECOND SHEET
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            ),
                            builder: (BuildContext context ){
                              return SizedBox(
                                height: MediaQuery.of(context).size.height*.6,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    SizedBox(height: height,),
                                    Image.asset('$img2'),
                                    SizedBox(height: 17,),
                                    Text('$msg1',
                                        style: TextStyle(
                                            fontFamily: 'poppins',fontSize: 23, color: color, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 17,),
                                    Text('$msg2',
                                        style: TextStyle(
                                            fontFamily: 'poppins',fontSize: 14, color: AppColors.klightBlack, fontWeight: FontWeight.w600)),
                                    MaterialButton(onPressed: onpress,
                                      color: Colors.blue,
                                      child: Text('Ok',
                                        style: TextStyle(fontFamily: 'poppins', fontSize: 15, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                        child: Center(
                          child: Text('$text',
                            style: TextStyle(fontFamily: 'poppins', fontSize: 16, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            );
      },
      child: Container(
        height: MediaQuery.of(context).size.height*.03,
        width: MediaQuery.of(context).size.width*.2,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text('$text',
            style: TextStyle(fontFamily: 'poppins', fontSize: 10, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}