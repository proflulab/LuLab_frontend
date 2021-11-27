import 'package:flutter/material.dart';

class UserAgreement extends StatefulWidget {
  UserAgreement({Key? key}) : super(key: key);

  @override
  _UserAgreementState createState() => _UserAgreementState();
}

class _UserAgreementState extends State<UserAgreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('隐私协议')),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: 1000,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '''**************************************************************************************************************************************************************************************************************************************************************************************************
''',
                style:
                    TextStyle(color: Colors.black, fontSize: 14, height: 1.4),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '视算新里程科技(北京)有限公司',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
