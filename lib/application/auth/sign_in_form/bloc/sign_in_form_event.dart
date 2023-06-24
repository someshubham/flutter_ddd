part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailStr) = _EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) = _PasswordChanged;
  const factory SignInFormEvent.registerWithEmailPasswordPressed() =
      _RegisterWithEmailPasswordPressed;
  const factory SignInFormEvent.signInWithEmailPasswordPressed() =
      _SignInWithEmailPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() =
      _SignInWithGooglePressed;
}
