import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Siempre se debe envolver en BlocProvider para tener acceso al bloc en cualquier widget hijo
    return BlocProvider(
      //* create se pone el bloc que queremos manejar
      create: (context) => CounterBloc(),
      //* Ahora en este widget _BlocCounterView se tiene acceso
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    //* El add permite disparar un evento
    //context.read<CounterBloc>().add(CounterIncrease(value));
    //* Otra forma, sin llamar el add
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: context.select((CounterBloc counterBloc) =>
              Text('Bloc Counter ${counterBloc.state.transactionCount}')),
          actions: [
            IconButton(
                onPressed: () {
                  //context.read<CounterBloc>().add(ResetCounter(value: 0));
                  context.read<CounterBloc>().resetCounter(0);
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        body: Center(
          child: context.select((CounterBloc counterBloc) =>
              Text('Conuter Value: ${counterBloc.state.counter}')),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => increaseCounterBy(context, 3),
              heroTag: '1',
              child: const Text('+3'),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () => increaseCounterBy(context, 2),
              heroTag: '2',
              child: const Text('+2'),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () => increaseCounterBy(context),
              heroTag: '3',
              child: const Text('+1'),
            )
          ],
        ));
  }
}
