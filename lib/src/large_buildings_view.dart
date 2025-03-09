import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_app/src/outer_sheath_view.dart';
import 'package:flutter_app/src/partitions_and_windows_view.dart';
import 'package:flutter_app/log.dart';

/// This view is for estimating large buildings.
class LargeBuildingsView extends StatefulWidget {
  const LargeBuildingsView({super.key});

  @override
  State<LargeBuildingsView> createState() => _LargeBuildingsViewState();
}

class _LargeBuildingsViewState extends State<LargeBuildingsView>
    with TickerProviderStateMixin {
  RemovableGroundsData removableGroundsData = RemovableGroundsData();
  late TabController _tabController;

  static const List<Tab> tabs = [
    Tab(
      text: "Ulkovaippa",
    ),
    Tab(
      text: "Muu",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    logger.d('LargeBuildingsView built');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: DefaultTabControllerListener(
        onTabChanged: (int index) {
          debugPrint('tab changed: $index');
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Suuret rakennukset'),
            bottom: TabBar(
              // controller: _tabController,
              tabs: tabs,
            ),
          ),
          // body: RemovableGroundsForm(data: removableGroundsData),
          body: TabBarView(children: [
            OuterSheathView(
              removableGroundsData: removableGroundsData,
            ),
            PartitionsAndWindowsView(),
          ]),
        ),
      ),
    );
  }
}

class DefaultTabControllerListener extends StatefulWidget {
  const DefaultTabControllerListener(
      {required this.onTabChanged, required this.child, super.key});

  final ValueChanged<int> onTabChanged;

  final Widget child;

  @override
  State<DefaultTabControllerListener> createState() =>
      _DefaultTabControllerListenerState();
}

class _DefaultTabControllerListenerState
    extends State<DefaultTabControllerListener> {
  TabController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final TabController? defaultTabController =
        DefaultTabController.maybeOf(context);

    assert(() {
      if (defaultTabController == null) {
        throw FlutterError(
          'No DefaultTabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.',
        );
      }
      return true;
    }());

    if (defaultTabController != _controller) {
      _controller?.removeListener(_listener);
      _controller = defaultTabController;
      _controller?.addListener(_listener);
    }
  }

  void _listener() {
    final TabController? controller = _controller;

    if (controller == null || controller.indexIsChanging) {
      return;
    }

    widget.onTabChanged(controller.index);
  }

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
