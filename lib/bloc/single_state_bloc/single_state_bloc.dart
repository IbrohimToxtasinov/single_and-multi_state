import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:working_with_bloc/data/models/my_response_model.dart';
import 'package:working_with_bloc/data/repositories/app_repository.dart';

part 'single_state_event.dart';

part 'single_bloc_state.dart';

class SingleStateBloc extends Bloc<FetchUsersCards, SingleBlocState> {
  SingleStateBloc({required this.appRepository})
      : super(SingleBlocState(status: Status.PURE, error: "", cards: [])) {
    on<FetchUsersCards>(_fetchData);
  }

  final AppRepository appRepository;

  _fetchData(FetchUsersCards event, Emitter<SingleBlocState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await appRepository.getAllCards();
    if (myResponse.error.isEmpty) {
      emit(state.copyWith(cards: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}
