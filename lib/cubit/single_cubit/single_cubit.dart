import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:working_with_bloc/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:working_with_bloc/data/models/my_response_model.dart';
import 'package:working_with_bloc/data/repositories/app_repository.dart';

part 'single_state.dart';

class SingleStateCubit extends Cubit<SingleState> {
  SingleStateCubit({required this.appRepository}) : super(SingleState());

  final AppRepository appRepository;

  fetchAllUserCards() async {
    emit(SingleState(status: Status.LOADING));
    MyResponse myResponse = await appRepository.getAllCards();
    if (myResponse.error == "") {
      emit(state.copyWith(cards: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}
