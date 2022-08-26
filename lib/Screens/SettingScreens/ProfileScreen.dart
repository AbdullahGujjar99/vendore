import 'package:flutter/material.dart';

import '../../AppColors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*(1/2),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/homebackground.png"), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: AppColors.kWhite,)),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.06,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  //color: AppColors.kWhite,
                  borderRadius: BorderRadius.all(Radius.circular(50),),
                    image: DecorationImage(
                        image: AssetImage("images/profile.png"), fit: BoxFit.cover)
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.158,
              left: MediaQuery.of(context).size.width*.55,
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 29,
                  width: 29,
                  decoration: const BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.all(Radius.circular(50),),
                      image: DecorationImage(
                          image: AssetImage("images/camera.png"), )
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.3,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    ProfileTextfieldWidget(label: 'Enter Name', icon: Icons.person,),
                    SizedBox(height: 20,),
                    ProfileTextfieldWidget(label: 'Phone Number', icon: Icons.phone,),
                    SizedBox(height: 20,),
                    ProfileTextfieldWidget(label: 'Enter Email', icon: Icons.email,),
                    SizedBox(height: 100,),
                    MaterialButton(
                      height: 40,
                      minWidth: 265,
                      color: AppColors.kBlueText,
                      onPressed: (){},
                      child: Text('Update',
                        style: TextStyle(fontFamily: 'poppins',fontSize: 15, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.25,
              child: Container(
                height: MediaQuery.of(context).size.height*.1,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(5),),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      //offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(text: TextSpan(
                          text: 'Status:',
                          style: const TextStyle(fontFamily: 'poppins', fontSize: 14, color: AppColors.kBlack, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: isSwitched ==true? ' Online':' Offline',
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 14, color: isSwitched ==true?AppColors.kDeliveredDark: AppColors.kRed, fontWeight: FontWeight.bold),)
                          ]
                      )),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: AppColors.kDeliveredlight,
                      activeColor: AppColors.kDeliveredDark,
                    ),
                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTextfieldWidget extends StatelessWidget {
  ProfileTextfieldWidget({
    Key? key, required this.label,required this.icon,
  }) : super(key: key);
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: "$label",
          suffixIcon: Icon(icon, color: AppColors.kBlueText,),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.kBlue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.kBlue,
              width: 2.0,
            ),
          ),
        )
    );
  }
}
