// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:episode_app/feature/episode/repository/episode_repository.dart';
import 'package:flutter/material.dart';

part 'error_event.dart';
part 'error_state.dart';

/// Bloc responsible for handling error events and states.
///
/// The `ErrorBloc` class extends the `Bloc` class from the `flutter_bloc` package,
/// and it manages the state of error-related events in the application.
///
/// It takes `ErrorEvent` as the event type and `ErrorState` as the state type.
class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc(this._episodeRepository) : super(ErrorInitial()) {
    on<ErrorEvent>(_onError);
    _errorSubscription = _episodeRepository.stream.listen((error) {
      add(ErrorSnackbarEvent(error.message));
    });
  }

  final EpisodeRepository _episodeRepository;

  StreamSubscription? _errorSubscription;

  FutureOr<void> _onError(ErrorEvent event, Emitter<ErrorState> emit) {
    emit(ErrorSnackbar(event.message));
  }
}
