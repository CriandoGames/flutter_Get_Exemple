import 'package:dio/dio.dart';
import 'package:virus_app/model/Home_model.dart';

class Api{

Future<ApiModel> fetchData() async //jBuscar dados
{

  try {

  final response = await Dio().get("https://api.covid19api.com/summary");
  
  if(response.statusCode ==200)
  return ApiModel.fromJson(response.data);
  else
  {
    return null;
  }
  
  } catch (e) {
    print(e);
    return null;
  }

 
}


}