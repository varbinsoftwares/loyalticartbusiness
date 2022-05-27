import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../config.dart';
import 'package:http/http.dart' as http;
//import 'redeem.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'sharepoints.dart';
import 'package:loyaltycardbusiness/rewards/qrcodescan.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({Key? key}) : super(key: key);

  //final String title;

  @override
  State<Qrcode> createState() => QrcodePage();
}

class QrcodePage extends State<Qrcode> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  static const routeName = 'points';

  Map userprofile = {};
  bool userloggein = false;
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userprofiletemp = (prefs.getString('profile') ?? "");
    //print(userprofiletemp);
    setState(() {
      if (userprofiletemp.isNotEmpty) {
        userprofile = jsonDecode(userprofiletemp);
        //print(userprofile);
        userloggein = true;
        // _getPointList(userprofile['id']);
      } else {
        userloggein = false;
        Navigator.pushNamedAndRemoveUntil(
            context, 'login', ModalRoute.withName('login'));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("QR"),
      // ),
      body: Center(child: const Text("Contact page")),
    );
  }
}
