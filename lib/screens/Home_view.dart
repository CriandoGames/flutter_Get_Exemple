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
          elevation: 6,
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {
            HomeController.to.Result();
          },
          builder: (_) {
            return _.data == null
                ? CircularProgressIndicator()
                : GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(_.data.countries.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(width: 0.5)),
                          width: 50,
                          height: 50,
                          child: Column(
                            children: <Widget>[
                              Text(
                                _.data.countries[index].country,
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Brazil_%281889%E2%80%931960%29.svg/1200px-Flag_of_Brazil_%281889%E2%80%931960%29.svg.png",
                                height: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Novos Casos: "),
                                  Text(
                                    _.data.countries[index].newConfirmed
                                        .toString(),
                                    style: TextStyle(color: Colors.orange),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Total de Mordes: "),
                                  Text(
                                    _.data.countries[index].totalDeaths
                                        .toString(),
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Recuperados: "),
                                  Text(
                                    _.data.countries[index].totalRecovered
                                        .toString(),
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Total de casos: "),
                                  Text(
                                    _.data.countries[index].totalConfirmed
                                        .toString(),
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Data: "),
                                  Text(
                                    _.data.countries[index].date
                                        .toString().replaceRange(10,24,'.'),
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
          },
        ));
  }
}
