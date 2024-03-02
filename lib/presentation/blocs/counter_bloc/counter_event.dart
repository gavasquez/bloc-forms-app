part of 'counter_bloc.dart';

//* CounterEvent nos sirve para saber que tipo de evento mi bloc va a recibir
sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncrease extends CounterEvent {
  final int value;
  CounterIncrease(this.value);
}

//* debe extender CounterEvent para que pueda ser utilizado como un evento permitido en mi bloc
class ResetCounter extends CounterEvent {
  final int value;
  ResetCounter({this.value = 0});
}
