import 'package:anime_hi/core/constants/colors.dart';
import 'package:anime_hi/dependency.dart';
import 'package:anime_hi/presentation/pages/home_screen.dart';
import 'package:anime_hi/presentation/state_management/info/info_bloc.dart';
import 'package:anime_hi/presentation/state_management/top_airing/top_airing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        title: 'AnimeHi',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: PRIMARY_COLOR,
          colorScheme: const ColorScheme.dark(
            secondary: SECONDARY_COLOR,
          ),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<TopAiringBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<InfoBloc>(),
            ),
          ],
          child: const HomeScreen(),
        ),
      );
    });
  }
}
