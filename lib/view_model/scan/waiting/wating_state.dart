import 'package:equatable/equatable.dart';

sealed class WaitingState extends Equatable {
  const WaitingState();
  @override
  List<Object?> get props => [];
}

final class WaitingLoadingState extends WaitingState {
  const WaitingLoadingState();
}

final class WaitingCompleteState extends WaitingState {
  const WaitingCompleteState();
}

final class WaitingErrorState extends WaitingState {
  final String message;

  const WaitingErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class OrderLoadingState extends WaitingState {
  const OrderLoadingState();
}

final class OrderCompleteState extends WaitingState {
  const OrderCompleteState();
}

final class OrderErrorState extends WaitingState {
  final String message;

  const OrderErrorState(this.message);

  @override
  List<Object> get props => [message];
}
