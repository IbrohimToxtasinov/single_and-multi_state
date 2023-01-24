import 'package:working_with_bloc/data/models/my_response_model.dart';

import '../services/api_services.dart';

class AppRepository {
  AppRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCards() => apiService.getAllCards();

}