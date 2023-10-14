import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_market_app/cubits/adding_cubit/adding_cubit.dart';
import 'package:mini_market_app/cubits/get_all/get_all_cubit.dart';
import 'package:mini_market_app/cubits/selling_cubit/selling_cubit.dart';
import 'package:mini_market_app/data/local/db/db.dart';
import 'package:mini_market_app/data/local/shared_pref/shared_pref.dart';
import 'package:mini_market_app/ui/home/home_screen.dart';
import 'package:mini_market_app/ui/widgets/example_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  LocalDatabase.getInstance;
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AddingCubit()),
        BlocProvider(create: (context)=>SellingCubit()),
        BlocProvider(create: (context)=>GetAllCubit()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: const ColorScheme.light(
                    primary: Colors.green
                )),
            home: HomeScreen(),
          );
        });
  }
}
