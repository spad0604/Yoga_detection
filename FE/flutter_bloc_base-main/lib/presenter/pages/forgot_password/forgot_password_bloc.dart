import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/entities/request/request_change_password.dart';
import 'package:flutter_starter/data/entities/request/verify_otp_request.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/data/usecases/change_password_uc.dart';
import 'package:flutter_starter/data/usecases/send_otp_uc.dart';
import 'package:flutter_starter/data/usecases/verify_otp_uc.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_event.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';

@injectable
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final OauthTokenManager _oauthTokenManager;
  final AuthRepository _authRepository;

  final ChangePasswordUseCase _changePassword;
  final SendOtpUc _sendOtpUc;
  final VerifyOtpUc _verifyOtpUc;

  ForgotPasswordBloc(
      {required ChangePasswordUseCase changePassword,
      required AuthRepository authRepository,
      required SendOtpUc sendOtpUc,
      required VerifyOtpUc verifyOtpUc,
      required OauthTokenManager oauthTokenManager})
      : _changePassword = changePassword,
        _authRepository = authRepository,
        _sendOtpUc = sendOtpUc,
        _verifyOtpUc = verifyOtpUc,
        _oauthTokenManager = oauthTokenManager,
        super(const ForgotPasswordState()) {
    on<ForgotPasswordErrorOccurred>(_onErrorOccurred);

    on<ChangePasswordRequested>(_onChangePasswordRequested);

    on<SetEmailEvent>((event, emit) => setEmail(event, emit));

    on<SendOtpRequested>(_onSendOtpRequested);

    on<VerifyOtpRequested>(_onVerifyOtpRequested);

    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ForgotPasswordErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onVerifyOtpRequested(
    VerifyOtpRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    final res = await _verifyOtpUc.call(VerifyOtpRequest(email: event.email, otp: event.otp));

    //Hung Todo: Lấy được token rồi thì gọi hàm dưới này để hệ thống lưu Token lại, dùng cho việc truyền vào header sau này
    await _oauthTokenManager.saveAccessToken(res.token);

    emit(state.copyWith(
      email: event.email,
      status: ForgotPasswordStatus.otpVerifySuccess,
    ));
  }

  FutureOr<void> _onSendOtpRequested(
    SendOtpRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    await _sendOtpUc.call(RequestChangePassword(email: event.email));
    emit(state.copyWith(
      email: event.email,
      status: ForgotPasswordStatus.otpSendSuccess,
    ));
  }

  void setEmail(SetEmailEvent event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onChangePasswordRequested(
    ChangePasswordRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    await _changePassword(
      ChangePasswordRequest(
        email: state.email!,
        newPassword: event.password,
        oldPassword: event.confirmPassword,
      ),
    );

    emit(state.copyWith(status: ForgotPasswordStatus.success));
  }

  FutureOr<void> _onErrorOccurred(
    ForgotPasswordErrorOccurred event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(
      status: ForgotPasswordStatus.failure,
      error: event.error,
    ));
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    try {
      await _authRepository.resetPassword(
        newPassword: event.newPassword,
        confirmNewPassword: event.confirmNewPassword,
      );
      emit(state.copyWith(status: ForgotPasswordStatus.changePasswordSuccess));
    } catch (e) {
      add(ForgotPasswordErrorOccurred(BaseException.from(e)));

      emit(state.copyWith(status: ForgotPasswordStatus.changePasswordFailure));
      return;
    }
  }
}
