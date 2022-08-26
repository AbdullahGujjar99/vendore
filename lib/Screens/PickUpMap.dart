import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';
import '../Widget/MapBottomButton.dart';
import '../Widget/MapDetailWidget.dart';
import 'OderPickDeliverScreen.dart';


class PickUpMap extends StatefulWidget {
  bool isVisible;
  String text;
  String appbar;
  Color color;
  PickUpMap({Key? key, required this.text,required this.color,required this.isVisible, required this.appbar}) : super(key: key);

  @override
  _PickUpMapState createState() => _PickUpMapState(isVisible, text,color, appbar);
}

class _PickUpMapState extends State<PickUpMap> {
  bool isVisible;
  String appbar;
  String text;
  Color color;

  _PickUpMapState(this.isVisible, this.text, this.color, this.appbar);
  void showToast() {
    setState(() {
      isVisible = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OderPickDeliverScreen(isDeliver: false,)),
      );
      text = 'Confirm Drop Off';
      color = AppColors.kDeliveredDark;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView( headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          pinned: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height*.1,
          flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: SafeArea(child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('$appbar',
                      style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),
                ),
              ),
              )
          ),
          leading: IconButton(onPressed: (){
        setState(() {
        Navigator.pop(context);
        });
        }, icon: Image.asset('images/arrow.png'),),
          actions: <Widget>[
            GestureDetector(onTap: (){},
                child: Image.asset('images/target.png')),//IconButton
          ],
        ),


      ];
    }, body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //MAP DETAIL WIDGET CALL
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: MapDetailWidget(color: AppColors.kPendingLight,),
              ),
              SizedBox(height: 21,),
              Stack( children: [
                Image.asset('images/maps.png', fit: BoxFit.fill, width: MediaQuery.of(context).size.width,),
                Positioned(
                  bottom: MediaQuery.of(context).size.height*.05,
                    child: MapBottomButton(text: text, onpress: showToast, color: color, isVisible: isVisible,),
                )
              ],),
            ],
          ),
        ),
      ),
      ),
    );
  }
}



