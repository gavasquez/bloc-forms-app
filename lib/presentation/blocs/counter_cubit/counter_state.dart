part of 'counter_cubit.dart';

//* Aca definimos como queremos que luzca nuestro estado.
//* Se extends de Equatable para validar si estado no cambio no se redibuje donde se este llamando
//* Equatable  nos permite comparar dos o mas objetos si no cambiaron no redibuja
class CounterState extends Equatable {
  // Asi va a lucir nuestro estado
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  //* Sacamos una copia con el copyWith y regresamos CounterState
  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount);

  @override
  //* cuales son los campos que vamos a considerar si son iguales
  List<Object> get props => [counter, transactionCount];
}
