import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/username.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body:  BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    //* Si se va a poner un input al final de la pantalla se puede hacer con SafeArea
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        //key: _formkey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              errorMessage: username.errorMessage,
              //username.isPure || username.isValid 
              //? null
              //: 'Usuario no válido',
              //validator: (value) {
              //  if (value == null || value.isEmpty) return 'Campo requerido!';
              //  if (value.trim().isEmpty) return 'Campo requerido!';
              //  if (value.trim().length < 6) return 'Mas de 6 letras';
              //  return null;
              //},
              onChanged: (value) {
                registerCubit.usernameChange(value);
                // Apenas se ejecute un cambio se valida
                //_formkey.currentState!.validate();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Correo electronico',
              errorMessage: email.errorMessage,
              //validator: (value) {
              //  if (value == null || value.isEmpty) return 'Campo requerido';
              //  if (value.trim().isEmpty) return 'Campo requerido';
              //  final emailRegExp = RegExp(
              //    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              //  );
              //  if (!emailRegExp.hasMatch(value))
              //    return 'No tiene formato de correo';
              //  return null;
              //},
              onChanged: (value) {
                registerCubit.emailChange(value);
                // Apenas se ejecute un cambio se valida
                //_formkey.currentState!.validate();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              errorMessage: password.errorMessage,
              //validator: (value) {
                //if (value == null || value.isEmpty) return 'Campo requerido';
                //if (value.trim().isEmpty) return 'Campo requerido';
                //if (value.trim().length < 6) return 'Mas de 6 letras';
                //return null;
              //},
              onChanged: (value) {
                registerCubit.passwordChange(value);
                // Apenas se ejecute un cambio se valida
                //_formkey.currentState!.validate();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                //final isValid = _formkey.currentState!.validate();
                //if (!isValid) {
                //  return;
                //}
                registerCubit.onSubmit();
              },
              icon: const Icon(Icons.save),
              label: const Text('Crear Usuario'),
            ),
          ],
        ));
  }
}
