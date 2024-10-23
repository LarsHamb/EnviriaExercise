part of 'error_bloc.dart';

@immutable
sealed class ErrorState {}

final class ErrorInitial extends ErrorState {}

final class ErrorSnackbar extends ErrorState {
  final String message;

  ErrorSnackbar(this.message);
}
