part of 'single_state_bloc.dart';

class SingleBlocState extends Equatable {
  Status status;
  String error;
  List cards;

  SingleBlocState({
    required this.status,
    required this.error,
    required this.cards,
  });

  SingleBlocState copyWith({
    Status? status,
    String? error,
    List? cards,
  }) {
    return SingleBlocState(
      error: error ?? this.error,
      cards: cards ?? this.cards,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, cards];
}

enum Status { PURE, LOADING, ERROR, SUCCESS }
