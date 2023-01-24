import 'package:working_with_bloc/data/models/banking_model.dart';

abstract class UserCardCubitsState {}

class InitialUserCardCubitsState extends UserCardCubitsState {}

class LoadUserCardCubitsInProgress extends UserCardCubitsState {}

class LoadUserCardCubitsInSuccess extends UserCardCubitsState {
  LoadUserCardCubitsInSuccess({required this.cards});

  final List<CardsModel> cards;
}

class LoadUserCardCubitsInFailure extends UserCardCubitsState {
  LoadUserCardCubitsInFailure({required this.error});

  String error;
}
