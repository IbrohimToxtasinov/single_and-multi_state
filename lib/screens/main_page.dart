import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/cubit/connectivity/connectivity_cubit.dart';
import 'package:working_with_bloc/no_internet/no_internet_page.dart';
import 'package:working_with_bloc/screens/user_cards_bloc_screen/user_cards_bloc_screen.dart';
import 'package:working_with_bloc/screens/user_cards_bloc_screen/user_cards_single_bloc.dart';
import 'package:working_with_bloc/screens/user_cards_cubit_screen/user_cards_cubit_screen.dart';
import 'package:working_with_bloc/screens/user_cards_cubit_screen/user_cards_single_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      UserCardsCubitScreen(),
      UserCardsBlocScreen(),
      SingleStateCubitScreen(),
      UserCardsSingleBlocScreen(),
    ];
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoInternetPage(voidCallback: _init),
              ));
        }
      },
      child: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_sharp), label: ""),
          ],
        ),
      ),
    );
  }
}
