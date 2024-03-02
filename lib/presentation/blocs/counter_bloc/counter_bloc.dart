import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

//* part => Siguinifica que es parte counter_event.dart
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    //* CounterIncrease
    //* on<CounterIncrease> significa cuando se dispara un evento CounterIncrease
    on<CounterIncrease>((event, emit) => _onCounterIcrease(event, emit));
    //* Se puede pasar asi tambien o como esta arriba
    on<ResetCounter>(_onReset);
  }

  void _onCounterIcrease(CounterIncrease event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onReset(ResetCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: event.value));
  }

  // Centrar la forma de llamar
  void increaseBy([int value = 1]) {
    add(CounterIncrease(value));
  }

  void resetCounter([int value = 0]) {
    add(ResetCounter(value: value));
  }
}
