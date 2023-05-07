import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_store/gen/assets.gen.dart';
import 'package:pet_store/presentation/bloc/cubit/history_cubit.dart';
import 'package:pet_store/presentation/states/history_states.dart';

import '../widgets/list_item.dart';

class AdoptionHistoryScreen extends StatelessWidget {
  static const String id = '/history';

  const AdoptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<HistoryCubit, HistoryState>(
        bloc: HistoryCubit(),
        builder: (context, state) {
          if (state is HistoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          if (state is HistoryPetsLoaded) {
            if (state.pets.length == 1) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "History",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .displayLarge
                          ?.copyWith(
                              fontSize: 70,
                              fontWeight: FontWeight.w200,
                              letterSpacing: 0),
                    ),
                    LottieBuilder.asset(
                      Assets.lottie.cuteDoggie,
                    ),
                    Text(
                      "Kinda Empty Here, Let's Adopt",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 27,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0,
                          ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.pets.length,
                itemBuilder: (context, index) {
                  final bool isLast = index == (state.pets.length + 1);
                  final bool isEven = index.isEven;
                  final bool showBreak = !isLast && !isEven;
                  var dateTime = DateTime.parse(
                    "${state.pets[index].adoptedDate}",
                  );
                  final newDateFormat = DateFormat("MMM dd, yyyy");

                  final String? date =
                      showBreak ? newDateFormat.format(dateTime) : null;

                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (index == 0) ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 50,
                              right: 120,
                              bottom: 30,
                            ),
                            child: Text(
                              "History",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .displayLarge
                                  ?.copyWith(
                                      fontSize: 70,
                                      fontWeight: FontWeight.w200,
                                      letterSpacing: 0),
                            ),
                          ),
                        ],
                        if (showBreak) ...[
                          Text(
                            date!,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .displayMedium,
                          ),
                          const SizedBox(height: 8),
                        ],
                        Visibility(
                          visible: !(index == 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: CustomPaint(
                                    painter: LinePainter(showBreak),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  flex: 5,
                                  child: PetHistoryItem(
                                    pet: state.pets[index],
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              );
            }
          } else {
            return ErrorWidget("exception");
          }
        },
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final bool showBreak;

  LinePainter(this.showBreak);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.grey[300]!;
    final Offset start = Offset(size.width / 2, 0);
    final Offset end = Offset(size.width / 2, size.height);

    canvas.drawLine(start, end, paint);

    if (showBreak) {
      final Offset breakStart = Offset(size.width / 2, size.height);
      final Offset breakEnd = Offset(size.width / 2, size.height + 20);
      canvas.drawLine(breakStart, breakEnd, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
