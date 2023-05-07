import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/presentation/bloc/cubit/history_cubit.dart';
import 'package:pet_store/presentation/states/history_states.dart';

import '../widgets/list_item.dart';

class LikedScreen extends StatelessWidget {
  static const String id = '/liked';

  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<HistoryCubit, HistoryState>(builder: (context, state) {
        if (state is HistoryLoadingState) {
          return const Center();
        }
        if (state is HistoryPetsLoaded) {
          return ListView.builder(
            itemCount: state.pets.length,
            itemBuilder: (context, index) {
              final bool isLast = index == state.pets.length;
              final bool isEven = index.isEven;
              final bool showBreak = !isLast && !isEven;
              var dateTime = DateTime.parse(
                "${state.pets[index].adoptedDate}",
              );
              var formate1 =
                  "${dateTime.day}-${dateTime.month}-${dateTime.year}";

              final String? date = showBreak ? formate1.toString() : null;

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
                          "Liked",
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
                        style: Theme.of(context).primaryTextTheme.displayMedium,
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
        } else {
          return const Center();
        }
      }),
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
