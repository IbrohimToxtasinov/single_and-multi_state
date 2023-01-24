import 'package:dio/dio.dart';
import 'package:working_with_bloc/data/models/banking_model.dart';
import 'package:working_with_bloc/data/models/my_response_model.dart';
import 'package:working_with_bloc/data/services/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCards() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data =
            (response.data as List).map((e) => CardsModel.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
