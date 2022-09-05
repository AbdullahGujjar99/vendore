import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendorapp/AppColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../Widget/DrawerBottonsWidget.dart';
import '../Widget/OrderWidgets.dart';
import 'PendingScreen.dart';
import 'SettingScreens/ChangePassword.dart';
import 'SettingScreens/EarningScreen.dart';
import 'SettingScreens/HelpCenterScreen.dart';
import 'SettingScreens/LogoutScreen.dart';
import 'SettingScreens/PrivacyPolicy.dart';
import 'SettingScreens/ProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


enum WidgetMaker{
  all, delivered, pendings, cancelled
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WidgetMaker selectedWidget = WidgetMaker.all;

  bool isSwitched = false;
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.06,),
                Row(children: [
                  Image.asset("images/profile.png"),
                  SizedBox(width: MediaQuery.of(context).size.width*.02,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user?.displayName as String,
                          style: TextStyle(fontFamily: 'poppins',fontSize: 16, color: AppColors.kBlueText, fontWeight: FontWeight.w700)),
                  Text(user?.email as String,
                      style: TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kLightBlackOPC, fontWeight: FontWeight.w700)),
                    ],
                  )
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(text: TextSpan(
                        text: 'Status:',
                        style: TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.kBlack, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: isSwitched ==true? ' Online':' Offline',
                            style: TextStyle(
                                fontFamily: 'poppins', fontSize: 14, color: isSwitched ==true?AppColors.kDeliveredDark: AppColors.kRed, fontWeight: FontWeight.bold),)
                        ]
                    )),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: AppColors.kDeliveredlight,
                      activeColor: AppColors.kDeliveredDark,
                    ),
                ],),
                Divider(height: 1,),
                DrawerButtonsWidget(onpress: () {
                  Navigator.pop(context);
                }, icon: 'images/home.png', text: 'Home',),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Divider(height: .5,color: AppColors.kBlackOpaque,),
                ),
                DrawerButtonsWidget(onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                }, icon: 'images/bike.png', text: 'My Profile',),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Divider(height: .5,color: AppColors.kBlackOpaque,),
                ),
                DrawerButtonsWidget(onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingScreen()));
                }, icon: 'images/order.png', text: 'Orders',),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Divider(height: .5,color: AppColors.kBlackOpaque,),
                ),
                DrawerButtonsWidget(onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const EarningScreen()));
                }, icon: 'images/wallet.png', text: 'Earnings',),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Divider(height: .5,color: AppColors.kBlackOpaque,),
                ),
                DrawerButtonsWidget(onpress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HelpCenter()));
                }, icon: 'images/phone2.png', text: 'Help Center',),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Divider(height: .5,color: AppColors.kBlackOpaque,),
                ),
                DrawerButtonsWidget(onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivacyPolicy()));
                }, icon: 'images/privacy.png', text: 'Privacy Policy',),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Divider(height: 1,color: AppColors.kBlackOpaque,),
                ),
                Visibility(visible: isSwitched== true,
                    child: Column(
                      children: [
                        DrawerButtonsWidget(onpress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
                        }, icon: 'images/privacy.png', text: 'Changed Password',),
                        Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                          child: Divider(height: 2,color: AppColors.kBlackOpaque,),
                        ),
                      ],
                    ),


                ),
                SizedBox(height: 30,),
                DrawerButtonsWidget(onpress: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogOut()));
                }, icon: 'images/logout.png', text: 'Logout',),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: Divider(height: 1,color: AppColors.kBlackOpaque,),
                ),
              ],
            ),
          ),
        ),
      ),
      body: NestedScrollView( headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            elevation: 0,
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height*.25,

            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/homebackground.png"), fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Orders', style: TextStyle(fontFamily: 'poppins',fontSize: 23, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text('20', style: TextStyle(fontFamily: 'poppins', fontSize: 23, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                              ],
                            ),

                            Container(color: AppColors.kWhite,
                              height: MediaQuery.of(context).size.height*.03,
                              //width: MediaQuery.of(context).size.width*.22,
                              width: 102,
                              child: Padding(
                                padding: const EdgeInsets.only(left:3.0, right: 3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.calendar_today_outlined, color: AppColors.kBlueText,size: 15,),
                                    Text('25/09/2022', style: TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlueText, fontWeight: FontWeight.w500),),
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
                )
            ),
            //ICON ICON
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset('images/menu.png'),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              Icon(Icons.notifications_none_outlined, color: AppColors.kWhite,), //IconButton
            ],
          ),


        ];
      }, body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height*.04,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/homebackground.png"), fit: BoxFit.cover)),
        ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Text('Orders',
                        style: TextStyle(fontFamily: 'poppins', fontSize: 20, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(onPressed: (){
                            setState(() {
                              selectedWidget = WidgetMaker.all;
                            });
                          }, child: Text('All', style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),),
                          FlatButton(onPressed: (){
                            setState(() {
                              selectedWidget = WidgetMaker.delivered;
                            });
                          }, child: Text('Delivered', style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),),
                          FlatButton(onPressed: (){
                            setState(() {
                              selectedWidget = WidgetMaker.pendings;
                            });
                          }, child: Text('Pendings', style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),),
                          FlatButton(onPressed: (){
                            setState(() {
                              selectedWidget = WidgetMaker.cancelled;
                            });
                          }, child: Text('Cancelled', style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kLightWhite, fontWeight: FontWeight.w500)),),
                        ],
                      ),
                    ),
                    Divider(height: 1,),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      //height: 500,
                      child: CustomWidget(),
                    )
                  ],
                ),
              ),
            ),
      ],),

      ),

    );
  }
  CustomWidget() {
    switch(selectedWidget){
      case WidgetMaker.all:
        return allWidget();
      case WidgetMaker.delivered:
        return deliveredWidget();
      case WidgetMaker.pendings:
        return pendingWidget();
      case WidgetMaker.cancelled:
        return cancelledWidget();
    }
    return allWidget();
  }
  allWidget(){
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderWidgets(onTab: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PendingScreen()),
            );
          },orderType: 'Pending', darkColor: AppColors.kPendingDark, lightColor: AppColors.kPendingLight,),
          OrderWidgets(onTab:(){
          },orderType: 'Cancelled', darkColor: AppColors.kRed, lightColor: AppColors.kLightRed,),
          OrderWidgets(onTab:(){},orderType: 'Delivered', darkColor: AppColors.kDeliveredDark, lightColor: AppColors.kDeliveredlight,),
        ],
      ),
    );
  }

  deliveredWidget() {
    return Column(
      children: [
        OrderWidgets(onTab:(){},orderType: 'Delivered', darkColor: AppColors.kDeliveredDark, lightColor: AppColors.kDeliveredlight,),
      ],
    );
  }

  pendingWidget() {
    return Column(
      children: [
        OrderWidgets(onTab:(){},orderType: 'Pending', darkColor: AppColors.kPendingDark, lightColor: AppColors.kPendingLight,),
      ],
    );
  }

  cancelledWidget() {
    return Column(
      children: [
        OrderWidgets(onTab:(){},orderType: 'Cancelled', darkColor: AppColors.kRed, lightColor: AppColors.kLightRed,),
      ],
    );
  }
}



