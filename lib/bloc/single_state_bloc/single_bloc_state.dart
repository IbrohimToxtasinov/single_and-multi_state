part of 'single_state_bloc.dart';

class SingleBlocState extends Equatable {
  Status? status;
  String? error;
  List? cards;

  SingleBlocState({
    this.status,
    this.error,
    this.cards,
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
