import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search_bloc.dart';
import '../../../events/search_events.dart';

class AnimatedSearchBar extends StatefulWidget {
  final SearchBloc searchBloc;

  const AnimatedSearchBar({Key? key, required this.searchBloc})
      : super(key: key);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: widget.searchBloc,
      builder: (context, state) {
        double width = state is SearchInProgress ? 200 : 48;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              state is SearchInProgress
                  ? const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(width: 16),
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  if (state is SearchInProgress) {
                    widget.searchBloc.add(SearchCanceled());
                    _controller.reverse();
                  } else {
                    widget.searchBloc.add(SearchStarted());
                    _controller.forward();
                  }
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.ellipsis_search,
                  progress:
                      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                    parent: _controller,
                    curve: const Interval(0, 0.5),
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
