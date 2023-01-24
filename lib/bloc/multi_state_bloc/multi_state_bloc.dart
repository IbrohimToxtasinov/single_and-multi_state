import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/multi_state_bloc/multi_state_event.dart';
import 'package:working_with_bloc/bloc/multi_state_bloc/multi_bloc_state.dart';
import 'package:working_with_bloc/data/models/my_response_model.dart';
import 'package:working_with_bloc/data/repositories/app_repository.dart';

class UserCardsBloc extends Bloc<UserCardsEvent, UserCardsBlocState> {
  UserCardsBloc({required this.appRepository}) : super(InitialUserCardsBlocState()) {
    on<FetchAllUsersCards>(_fetchAllAlbums);
  }

  final AppRepository appRepository;

  _fetchAllAlbums(
      FetchAllUsersCards event, Emitter<UserCardsBlocState> emit) async {
    //loading
    emit(LoadUserCardsBlocInProgress());
    MyResponse myResponse = await appRepository.getAllCards();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadUserCardsBlocInSuccess(cards: myResponse.data));
    } else {
      //error
      emit(LoadUserCardsBlocInFailure(errorText: myResponse.error));
    }
  }
}
