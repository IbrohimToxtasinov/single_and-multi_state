import 'package:working_with_bloc/data/models/banking_model.dart';

abstract class UserCardsBlocState {}

class InitialUserCardsBlocState extends UserCardsBlocState {}

class LoadUserCardsBlocInProgress extends UserCardsBlocState {}

class LoadUserCardsBlocInSuccess extends UserCardsBlocState {
  LoadUserCardsBlocInSuccess({required this.cards});

  final List<CardsModel> cards;
}

class LoadUserCardsBlocInFailure extends UserCardsBlocState {
  LoadUserCardsBlocInFailure({required this.errorText});

  final String errorText;
}