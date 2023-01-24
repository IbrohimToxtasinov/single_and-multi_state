import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/cubit/multi_state_cubit/multi_cubit_state.dart';
import 'package:working_with_bloc/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:working_with_bloc/data/repositories/app_repository.dart';
import 'package:working_with_bloc/utils/images.dart';
import 'package:working_with_bloc/utils/styles.dart';

class UserCardsCubitScreen extends StatefulWidget {
  const UserCardsCubitScreen({Key? key}) : super(key: key);

  @override
  State<UserCardsCubitScreen> createState() => _UserCardsCubitScreenState();
}

class _UserCardsCubitScreenState extends State<UserCardsCubitScreen> {
  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }

  hexcardnumber(String colorhexcode) {
    String colornew = colorhexcode;
    colornew = colornew.replaceAll(" ", "  ");
    return colornew;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserCardsCubit(appRepository: context.read<AppRepository>()),
      child: BlocBuilder<UserCardsCubit, UserCardCubitsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Multi State Bloc")),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state is LoadUserCardCubitsInProgress
                    ? const Center(child: CircularProgressIndicator())
                    : state is LoadUserCardCubitsInSuccess
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: state.cards.length,
                              itemBuilder: (context, index) {
                                debugPrint("Length : ${state.cards.length}");
                                return Container(
                                  margin: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 20, right: 20),
                                  padding: const EdgeInsets.only(
                                      top: 11, right: 20, left: 20, bottom: 14),
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(hexColor(state
                                              .cards[index].colors.colorA)),
                                          Color(hexColor(state
                                              .cards[index].colors.colorB)),
                                        ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: Image.asset(
                                                AppImages.bankIcon[index]),
                                          ),
                                          Text(
                                            state.cards[index].bankName,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 40,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: NetworkImage(state
                                                    .cards[index].iconImage),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Color(hexColor('F6E304')),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: const [
                                            Divider(
                                              thickness: 0.5,
                                              color: Colors.black,
                                              height: 14,
                                            ),
                                            Divider(
                                                thickness: 0.5,
                                                color: Colors.black,
                                                height: 2),
                                            Divider(
                                                thickness: 0.5,
                                                color: Colors.black,
                                                height: 14),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 18, top: 15),
                                        child: Text(
                                            hexcardnumber(
                                                state.cards[index].cardNumber),
                                            style: MyStyles.credic.copyWith(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              84,
                                        ),
                                        child: Text("01/24",
                                            style: MyStyles.credic.copyWith(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 18,
                                            ),
                                            child: Text(
                                              "Ibrohim Toxtasinov",
                                              style: MyStyles.regular.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.more_vert,
                                              color: Colors.white, size: 36),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : state is LoadUserCardCubitsInFailure
                            ? Center(
                                child: Text(state.error.toString()),
                              )
                            : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
