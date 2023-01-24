import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/multi_state_bloc/multi_state_bloc.dart';
import 'package:working_with_bloc/bloc/multi_state_bloc/multi_state_event.dart';
import 'package:working_with_bloc/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:working_with_bloc/cubit/connectivity/connectivity_cubit.dart';
import 'package:working_with_bloc/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:working_with_bloc/cubit/single_cubit/single_cubit.dart';
import 'package:working_with_bloc/data/repositories/app_repository.dart';
import 'package:working_with_bloc/data/services/api_services.dart';
import 'package:working_with_bloc/screens/main_page.dart';
import 'package:working_with_bloc/screens/user_cards_bloc_screen/user_cards_bloc_screen.dart';
import 'package:working_with_bloc/screens/user_cards_cubit_screen/user_cards_cubit_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AppRepository(
            apiService: ApiService(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConnectivityCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  SingleStateCubit(appRepository: context.read<AppRepository>())
                    ..fetchAllUserCards()),
          BlocProvider(
              create: (context) =>
                  SingleStateBloc(appRepository: context.read<AppRepository>())
                    ..add(FetchUsersCards())),
          BlocProvider(
              create: (context) => UserCardsBloc(
                  appRepository: context.read<AppRepository>())..add(FetchAllUsersCards())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
