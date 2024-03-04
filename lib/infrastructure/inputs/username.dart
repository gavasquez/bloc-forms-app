import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  //* Valor incial
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty({required String value}) : super.dirty(value);

  String? get errorMessage {
    if(isValid|| isPure) return null;
    if(displayError == UsernameError.empty) return 'El campo es requerido';
    if(displayError == UsernameError.length) return 'Mínimo de 6 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  //* Validaciones
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;
    return null;
  }
}
