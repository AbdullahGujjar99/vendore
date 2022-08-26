import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../AppColors.dart';

class ShowChatScreen extends StatefulWidget {
  String name;
  ShowChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  _ShowChatScreenState createState() => _ShowChatScreenState(name);
}

class _ShowChatScreenState extends State<ShowChatScreen> {
  String name;
  _ShowChatScreenState(this.name);

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "hello",
        messageType: "receiver", time: '09:30'),
    ChatMessage(messageContent: "Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor.",
        messageType: "receiver", time: '09:30'),
    ChatMessage(messageContent: "Nam tempus turpis", messageType: "sender", time: '09:35'),
    ChatMessage(messageContent: "Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor..",
        messageType: "receiver", time: '09:40'),
  ];
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
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: TextStyle(fontFamily: 'poppins',fontSize: 18, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                  Text('Last Seen 1h Ago',
                    style: TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.klightBlack, fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  ListView.builder(
                    itemCount: messages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                              child: Align(
                                alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                                ),
                              ),
                            ),
                          ),
                          Text(messages[index].time,
                              style: TextStyle(
                                  fontFamily: 'poppins',fontSize: 12, color: AppColors.klightBlack, fontWeight: FontWeight.w600)),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height*.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  //offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.add_circle_outline,color: Colors.grey.shade600, size: 20,),
                        prefixIcon: Icon(Icons.emoji_emotions_outlined,color: Colors.grey.shade600, size: 20,),
                        hintText: "Type message here",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    height: 19,
                    width: 19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Image.asset('images/send.png', fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(width: 15,),
              ],
            ),
          ),
        ),
      ],),

      ),
    );
  }
}

class ChatMessage{
  String messageContent;
  String messageType;
  String time;
  ChatMessage({required this.messageContent, required this.messageType, required this.time});
}
