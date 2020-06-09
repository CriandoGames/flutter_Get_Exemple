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
      body: Center(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {
            HomeController.to.Result();
          },
          builder: (_) {
            return _.data == null
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total de casos no mundo!",
                          style: Theme.of(context).textTheme.headline5),
                      Text(
                        _.data.global.totalConfirmed.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text("Total de Mortes no Mundo!",
                          style: Theme.of(context).textTheme.headline5),
                      Text(
                        _.data.global.totalDeaths.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text("Total Recuperados no mundo!",
                          style: Theme.of(context).textTheme.headline5),
                      Text(
                        _.data.global.totalRecovered.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
