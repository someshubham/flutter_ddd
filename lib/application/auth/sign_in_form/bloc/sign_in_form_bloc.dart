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
      event.map(
        emailChanged: (e) {
          emit(state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccessOption: none(),
          ));
        },
        passwordChanged: (e) {
          emit(state.copyWith(
            password: Password(e.passwordStr),
            authFailureOrSuccessOption: none(),
          ));
        },
        registerWithEmailPasswordPressed: (e) async {
          _performActionOnAuthFacadeWithEmailAndPassword(
            emit,
            _authFacade.registerWithEmailAndPassword,
          );
        },
        signInWithEmailPasswordPressed: (e) async {
          _performActionOnAuthFacadeWithEmailAndPassword(
            emit,
            _authFacade.signInWithEmailAndPassword,
          );
        },
        signInWithGooglePressed: (e) async {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));
          final failureOrSuccess = await _authFacade.signInWithGoogle();
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ));
        },
      );
    });
  }

  void _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function(
            {required EmailAddress emailAddress, required Password password})
        forwardedCall,
  ) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
