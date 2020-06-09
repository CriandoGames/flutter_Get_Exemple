import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virus_app/controller/Home_Controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Corona Virus in word"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_){
            HomeController.to.Result();
          },
          builder: (_) {
            return  _.data == null ? CircularProgressIndicator() : Text(_.data.global.totalConfirmed.toString());
          },
        ));
  }
}
