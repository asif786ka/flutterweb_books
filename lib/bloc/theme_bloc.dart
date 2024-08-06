import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final ThemeData themeData;

  ThemeChanged(this.themeData);
}

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData(primarySwatch: Colors.orange))) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(event.themeData));
    });
  }
}
