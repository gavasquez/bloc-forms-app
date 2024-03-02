import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

// Manejador del estado
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));

  // Incrementar el count y transactionCount
  void increaseBy({required int value}) {
    //* Con el state obtenemos el valor del counter_state
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  // Resetear el valor
  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
