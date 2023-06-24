import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/domain/auth/auth_failure.dart';
import 'package:flutter_ddd/domain/auth/i_auth_facade.dart';
import 'package:flutter_ddd/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      // event.map(
      //   emailChanged: (e) {
      //     emit(
      //       state.copyWith(
      //         emailAddress: EmailAddress(e.emailStr),
      //         authFailureOrSuccessOption: none(),

      //       ),
      //     );
      //   },
      //   passwordChanged: passwordChanged,
      //   registerWithEmailPasswordPressed: registerWithEmailPasswordPressed,
      //   signInWithEmailPasswordPressed: signInWithEmailPasswordPressed,
      //   signInWithGooglePressed: signInWithGooglePressed,
      // );
    });
  }
}
