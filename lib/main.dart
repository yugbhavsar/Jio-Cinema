import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeStyleCubit(),
      child: BlocBuilder<ThemeStyleCubit, ThemeStyleState>(
        builder: (context, state) {
          Color barColor = Colors.white;
          if (state is ThemeStyleInitial) {
            barColor = state.barColor;
          } else if (state is ThemeStyleNavColorPrimary) {
            barColor = state.barColor;
          }
          return MaterialApp(
              title: "EventHub",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(color: barColor)),
              initialRoute: RouteName.introductionScreen,
              onGenerateRoute: AppRoute.generateRoute
          );
        },
      ),
    );
  }
}


