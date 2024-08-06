import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:animations/animations.dart';
import 'package:top_books_website_asif/bloc/book_bloc.dart';
import 'package:top_books_website_asif/repositories/book_repository.dart';
import 'package:top_books_website_asif/service_locator.dart';
import 'package:top_books_website_asif/views/home_screen.dart';
import 'package:top_books_website_asif/views/book_details.dart';

import 'models/book.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookRepository = getIt<BookRepository>();
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/book',
          builder: (context, state) {
            final book = state.extra as Book;
            return BookDetailsScreen(book: book);
          },
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
          create: (context) => BookBloc(bookRepository: bookRepository),
        ),
      ],
      child: MaterialApp.router(
        title: 'Top Books Website Asif',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        builder: (context, child) {
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (
                Widget child,
                Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation,
                ) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: child!,
          );
        },
      ),
    );
  }
}
