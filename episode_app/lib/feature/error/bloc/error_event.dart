part of 'error_bloc.dart';

@immutable
sealed class ErrorEvent {
  final String message;
  const ErrorEvent(this.message);
}

final class ErrorSnackbarEvent extends ErrorEvent {
  const ErrorSnackbarEvent(super.message);
}
