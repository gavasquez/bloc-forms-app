import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Envolvemos el _CubitCounterView en el BlocProvider para tener acceso
    return BlocProvider(
        create: (context) {
          return CounterCubit();
        },
        child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterby(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value: value);
  }

  @override
  Widget build(BuildContext context) {
    //* Otra forma de obtener, esta es la forma tradicional
    //final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
        appBar: AppBar(
          title:
              //* Otra forma de estar pendiente del state
              context.select(
            (CounterCubit value) {
              return Text('Cubit Counter ${value.state.transactionCount}');
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<CounterCubit>().reset();
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        //* BlocBuilder sirve para embolver un widget para que se solo redibuja ese widget si el state cambia
        body: BlocBuilder<CounterCubit, CounterState>(
          //* Condicionar para que solo cambien cuando state cambie
          //buildWhen: (previous, current) => current.counter != previous.counter,
          //* builder ya tenemos acceso al state
          builder: (context, state) {
            print('Estado cambio!');
            return Center(
              child: Text('Conuter Value: ${state.counter}'),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => increaseCounterby(context, 3),
              heroTag: '1',
              child: const Text('+3'),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () => increaseCounterby(context, 2),
              heroTag: '2',
              child: const Text('+2'),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () => increaseCounterby(context),
              heroTag: '3',
              child: const Text('+1'),
            )
          ],
        ));
  }
}
