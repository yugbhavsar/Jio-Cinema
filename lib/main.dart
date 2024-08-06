import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Screens/SideDrawer/bloc/side_drawer_bloc.dart';
import 'package:jiocinema_clone/Utilities/GlobalFunctions.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilities.dart';

import 'Cubit/loader_view_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceUtils.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) =>  ThemeStyleCubit(),),
          
          BlocProvider(create: (context) => SideDrawerBloc(),),

          BlocProvider(create: (context) => LoaderViewCubit(),),
        ], 
        child: BlocBuilder<ThemeStyleCubit, ThemeStyleState>(
      builder: (context, state)  {
        Color barColor = Colors.white;
        if (state is ThemeStyleInitial) {
          barColor = state.barColor;
        } else if (state is ThemeStyleNavColorPrimary) {
          barColor = state.barColor;
        }
        return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            title: "EventHub",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(color: barColor)),
            initialRoute: RouteName.splashScreen,
            onGenerateRoute: AppRoute.generateRoute
        );
      },
    )
    );
  }
}
