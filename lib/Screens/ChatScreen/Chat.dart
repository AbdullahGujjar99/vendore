import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../AppColors.dart';
import 'ShowChat.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<String> name = ["Circle Clothing","Luxury house decor","Circle Clothing","Luxury house decor","Circle Clothing"];
  List<String> credit = ["Today","2 days ago","3 days ago","5 days ago", "10 days ago"];
  List<String> notification = ["2","0","2","0","0"];
  List<String> img = ["images/chatp1.png","images/chatp2.png","images/chatp1.png","images/chatp2.png","images/chatp1.png"];
  bool? isNoti;
  showNotification(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView( headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            elevation: 0,
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height*.12,

            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.kBlueText
                  ),
                ),
                )
            ),
            //ICON ICON
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
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
          height: MediaQuery.of(context).size.height*.1,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: AppColors.kBlueText
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(30), topRight: Radius.circular(30))
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Chats',
                  style: TextStyle(fontFamily: 'poppins',fontSize: 23, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search Chat",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.grey.shade100
                        )
                    ),
                  ),
                ),
                // TextFormField(
                //     decoration: InputDecoration(
                //       hintText: "Search",hintStyle: TextStyle(color: AppColors.klightBlack, fontSize: 15,fontWeight: FontWeight.w600),
                //       suffixIcon: Icon(Icons.search,),
                //       fillColor: Colors.white,
                //       filled: true,
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(40.0),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(40.0),
                //       ),
                //     )
                // ),
              ],
            ),
          ),
        ),
        Positioned(top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10),
              child: ListView.builder
                (
                  itemCount: name.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    if(notification[index]== "0"){
                      isNoti = false;
                    }
                    else{
                      isNoti = true;
                    }
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowChatScreen(name: name[index],)),
                        );
                      },
                      child: Padding(
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
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: AppColors.kWhite,
                                        borderRadius: const BorderRadius.all(Radius.circular(18),),
                                      ),
                                      child: Image.asset(img[index], fit: BoxFit.fill,)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(name[index], style:
                                      TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kBlackOpaque, fontWeight: FontWeight.w600),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(credit[index], style:
                                          TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlackOpaque, fontWeight: FontWeight.w500),),
                                          //SizedBox(width:  MediaQuery.of(context).size.width*.4,),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 19,),
                                  Visibility(visible: isNoti== true,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: AppColors.kDeliveredDark,
                                        borderRadius: const BorderRadius.all(Radius.circular(9),),
                                      ),
                                      child: Center(
                                        child: Text(notification[index] as String, style:
                                        TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kWhite, fontWeight: FontWeight.w600),),
                                      ),
                                    ),
                                  ),
                                  //Text(litems[index]),
                                ],
                              ),
                            )),
                      ),
                    );
                  }
              ),
            ),
          ),
        ),
      ],),

      ),
    );
  }
}
