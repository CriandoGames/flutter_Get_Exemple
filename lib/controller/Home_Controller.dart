import 'package:get/get.dart';
import 'package:virus_app/model/Home_model.dart';
import 'package:virus_app/src/Home_Repository.dart';

class HomeController extends GetController{
  static HomeController get to => Get.find();

  ApiModel data;

  void Result() async
  {
    Api api = Api();
    final response = await api.fetchData(); //recupera os dados
    if(response == null){
      Get.snackbar("Erro", "não foi possivel conectar ao servidor");
    }else{
      data = response;
          this.update();
    }

  }
  

}