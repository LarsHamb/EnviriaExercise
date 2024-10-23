import 'package:episode_app/feature/error/bloc/error_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A stateless widget that listens for errors and handles them appropriately.
///
/// This widget can be used to wrap other widgets and provide error handling
/// functionality. When an error occurs, it can display an error message or
/// take other appropriate actions.
class ErrorListener extends StatelessWidget {
  final Widget child;
  const ErrorListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorBloc, ErrorState>(
        listener: (context, state) => {
              if (state is ErrorSnackbar)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      duration: const Duration(seconds: 2),
                    ),
                  )
                }
            },
        child: child);
  }
}
