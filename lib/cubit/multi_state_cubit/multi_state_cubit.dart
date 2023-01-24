import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/cubit/multi_state_cubit/multi_cubit_state.dart';
import 'package:working_with_bloc/data/models/my_response_model.dart';
import 'package:working_with_bloc/data/repositories/app_repository.dart';

class UserCardsCubit extends Cubit<UserCardCubitsState> {
  UserCardsCubit({
    required this.appRepository,
  }) : super(InitialUserCardCubitsState()) {
    _fetchReviewsInfo();
  }

  final AppRepository appRepository;

  _fetchReviewsInfo() async {
    emit(LoadUserCardCubitsInProgress());
    MyResponse myResponse = await appRepository.getAllCards();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadUserCardCubitsInSuccess(cards: myResponse.data));
    } else {
      //error
      emit(LoadUserCardCubitsInFailure(error: myResponse.error));
    }
  }
}
