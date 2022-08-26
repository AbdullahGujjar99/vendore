import 'package:flutter/material.dart';

import '../../AppColors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kBlueText,
        ),
        elevation: 0,
        backgroundColor: AppColors.kWhite,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset("images/sapiens.png"),
              const SizedBox(height: 20,),
              const Text('Privacy Policy',
                style: TextStyle(fontFamily: 'poppins',fontSize: 22, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Container(
                height: 393-70,
                width: 336,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: AppColors.kBlueText
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Consectetur Adipiscing',
                        style: TextStyle(fontFamily: 'poppins',fontSize: 16, color: AppColors.kBlack, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor.'
                          'Sample Unordered List'
                          '1. Comodous in tempor ullamcorper miaculis.'
                          '2. Pellentesque vitae neque mollis urna mattis laoreet.'
                          '3. Divamus sit amet purus justo.'
                          'Proin at ex in nisl pulvinar consectetur non ut dui. In a egestas nisl. '
                          'Duis eu rutrum dui, posuere luctus ex. In ullamcorper nec tortor vel vulputate. '
                          'Ut et risus id erat pretium eleifend et faucibus justo. Nunc pretium aliquet nunc id dictum. '
                          'Aenean ornare convallis ipsum,',
                        style: TextStyle(fontFamily: 'poppins',fontSize: 12, color: AppColors.kBlack, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
