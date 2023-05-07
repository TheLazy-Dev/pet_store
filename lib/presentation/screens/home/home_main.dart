import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_store/presentation/bloc/cubit/history_cubit.dart';
import 'package:pet_store/presentation/screens/history/history_main.dart';
import 'package:pet_store/presentation/screens/home/widgets/banner.dart';

import '../../bloc/cubit/home_cubit.dart';
import '../../bloc/cubit/theme_cubit.dart';
import '../../states/home_states.dart';
import 'pets/pet_list.dart';

class Home extends StatelessWidget {
  static const String id = "/home";
  static GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: Transform.rotate(
          angle: 0.7,
          child: Icon(
            FontAwesomeIcons.paw,
            size: 30,
            color: Colors.brown.shade400,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                splashRadius: 0.1,
                onPressed: () => context.read<ThemeCubit>().changeTheme(),
                icon: Icon(
                    context.read<ThemeCubit>().currentTheme == Themes.Light
                        ? FontAwesomeIcons.moon
                        : FontAwesomeIcons.sun,
                    color: IconTheme.of(context).color,
                    size: 40),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  HistoryCubit();
                  Navigator.pushNamed(context, AdoptionHistoryScreen.id);
                },
                icon: Icon(Icons.menu_book_rounded,
                    semanticLabel: "History",
                    color: IconTheme.of(context).color,
                    size: 40),
              ),
              const SizedBox(
                width: 10,
              ),
              // IconButton(
              //   splashRadius: 0.1,
              //   onPressed: () => Navigator.pushNamed(context, LikedScreen.id),
              //   icon: Icon(FontAwesomeIcons.heart,
              //       color: IconTheme.of(context).color, size: 40),
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: Icon(Icons.search_outlined,
                    color: IconTheme.of(context).color, size: 40),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center();
        }
        if (state is HomePetsLoaded) {
          return LayoutBuilder(
              builder: (context, constrains) => Column(
                    children: [
                      const SizedBox(
                        height: 0,
                      ),
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 50,
                                  right: 120,
                                  bottom: 30,
                                ),
                                child: Text(
                                  "Home",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displayLarge,
                                ),
                              ),
                              const Center(child: HomeBanner()),
                              SizedBox(
                                  height: state.pets.length < 20
                                      ? constrains.maxHeight * 1.4
                                      : constrains.maxHeight * 2.6,
                                  child: const PetList())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
        } else {
          return const Center();
        }
      }),
    );
  }
}
