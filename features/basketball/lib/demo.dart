import 'package:flutter/material.dart';
// import 'package:shared/ui/app_scroll_behavior.dart';

import './scaling_info.dart';
import './demo_data.dart';
import './scores_app_bar.dart';
import './notifications.dart';
import './game_list_view.dart';
import './pull_to_refresh_container.dart';

class BasketballPTRDemo extends StatelessWidget {
  const BasketballPTRDemo({super.key ,});
  static const routePath = '/basketball';

  static Route<void> route(RouteSettings? settings) {
    return MaterialPageRoute(settings: settings,builder: (context) => const BasketballPTRDemo());
  }


  @override
  Widget build(context) {
    return const SafeArea(child: Material(child: BasketballPTRHome()));
  }
}

class BasketballPTRHome extends StatefulWidget {
  const BasketballPTRHome({super.key});

  @override
  State createState() {
    return _BasketballPTRHomeState();
  }
}

class _BasketballPTRHomeState extends State<BasketballPTRHome>
    with SingleTickerProviderStateMixin {
  BasketballGameModel _model = BasketballGameModel();

  final ScrollController _scrollController = ScrollController();

  late final AnimationController _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      upperBound: 1.0);

  late Animation<double> _pullAnimation;

  double _percentage = 0.0;
  bool _isLoading = false;

  double? _maxHeight;

  final ValueNotifier<bool> _refreshNotifier = ValueNotifier(false);

  @override
  void initState() {
    _pullAnimation = Tween<double>(begin: 1.2, end: 0.0).animate(_controller);
    _pullAnimation.addListener(() {
      setState(() {
        _percentage = _pullAnimation.value;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    ScalingInfo.init(MediaQuery.of(context));
    // Determine the max height of the pull to refresh area
    _maxHeight ??=
        (MediaQuery.of(context).size.height * 0.325).clamp(0.0, 180.0);
    final pullHeight = _maxHeight!;
    // Build a simple scaffold of the various app components
    return Column(
      children: [
        ScoresAppBar(),
        // For triggering the animation detect on start and on end loading
        NotificationListener<LoadingNotification>(
          onNotification: _handleLoadingNotification,
          child: PullToRefreshContainer(
            maxHeight: pullHeight,
            height: _percentage * pullHeight,
            refreshNotifier: _refreshNotifier,
          ),
        ),
        // For controlling the scrolling, listen to the scrolling notifications that bubble up from the scroll view
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: _handleOverscrollNotification,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: GameListView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                model: _model),
          ),
        )
      ],
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    double deltaOffset = 0.0;

    if (notification is ScrollEndNotification) {
      if (!_isLoading) {
        if (_percentage < 1.05) {
          _reset();
        } else {
          _refreshNotifier.value = !_refreshNotifier.value;
          _relax();
        }
      }
    }

    if (notification is ScrollUpdateNotification) {
      if (notification.dragDetails == null &&
          _percentage >= 1.2 &&
          notification.scrollDelta != 0) {
        _scrollController.jumpTo(_scrollController.offset);
      }
      if (notification.scrollDelta != null) {
        if (notification.scrollDelta! > 0.0) {
          deltaOffset += notification.scrollDelta!;
        } else if (_scrollController.offset < 0) {
          deltaOffset += notification.scrollDelta!;
        }
      }
    }

    if (notification is OverscrollNotification) {
      if (notification.overscroll < 0.0) {
        deltaOffset += notification.overscroll;
      }
    }

    if (_percentage > 0.0) {
      // We are scrolling the ptr area not the view so make sure the view stays static
      _scrollController.position.correctPixels(0);
    }

    _pull(deltaOffset);

    return false;
  }

  Future<void> _pull(double offset) async {
    // Wait until next event loop to call setState of flutter will yell at you
    await Future<void>.value();

    if (!_isLoading) {
      setState(() {
        _percentage += (-offset / _maxHeight!);
        _percentage = _percentage.clamp(0.0, 1.2);
      });
    }
  }

  bool _handleOverscrollNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) return false;

    notification.disallowIndicator();
    return false;
  }

  bool _handleLoadingNotification(LoadingNotification notification) {
    if (notification is DoneLoadingNotification) {
      _reset();
    } else {
      _isLoading = true;
    }

    return false;
  }

  Future<void> _reset() async {
    // Wait until next event loop to advance animation and call setState or flutter will yell at you
    await Future<void>.value();

    _controller.forward(from: 1.0 - _percentage * 0.83);
    if (_isLoading) {
      setState(() {
        _model = BasketballGameModel.randomize();
      });
    }
    _isLoading = false;
  }

  Future<void> _relax() async {
    await Future<void>.value();
    _controller.value = 1.0 - _percentage * 0.83;
    _controller.animateTo(0.22);
  }
}
