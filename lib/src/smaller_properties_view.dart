import 'package:flutter/material.dart';
import 'package:flutter_app/src/sp-forms/foundation_form.dart';
import 'package:flutter_app/src/sp-forms/small_property_basic_information_form.dart';
import 'package:flutter_app/src/sp-forms/SB_removable_grounds_form.dart';
import 'package:flutter_app/src/shared/navigation_buttons.dart';
import 'package:flutter_app/src/sp-forms/walls_form.dart';
import 'package:flutter_app/src/tab_view.dart';
import 'shared/cancel_dialog.dart';

/// This view is for estimating smaller row houses and blocks of flats.
class SmallerPropertiesView extends StatefulWidget {
  const SmallerPropertiesView({super.key});

  @override
  State<SmallerPropertiesView> createState() => _SmallerBuildingsViewState();
}

class _SmallerBuildingsViewState extends State<SmallerPropertiesView>
    with TickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: "Perustukset & ulkovaippa"),
    Tab(text: "Huoneistot"),
    Tab(text: "Piharakennukset & rakenteet"),
    Tab(text: "Purkumateriaalit"),
    Tab(text: "ARA-Taulukko"),
    Tab(text: "Tallenna tiedosto"),
  ];

  List<Widget> outerSheathForms() => [
        SmallPropertyBasicInformationForm(),
        SBRemovableGroundsForm(),
        SmallPropertiesFoundationForm(),
        WallsForm(),
        NavigationButtons(),
      ];

  List<Widget> apartmentsForms() => [
        NavigationButtons(),
      ];

  List<Widget> yardBuildingsAndStructures() => [
        NavigationButtons(),
      ];

  List<Widget> demolitionMaterials() => [
        NavigationButtons(),
      ];

  List<Widget> araTable() => [
        NavigationButtons(),
      ];

  List<Widget> saveFile() => [
        NavigationButtons(),
      ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: DefaultTabControllerListener(
        onTabChanged: (int index) {
          debugPrint('tab changed: $index');
        },
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (_, __) => showDialog<String>(
              context: context, builder: (_) => CancelDialog()),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Rivi- ja pienkerrostalot'),
              bottom: TabBar(
                // controller: _tabController,
                tabs: tabs,
              ),
            ),
            // body: RemovableGroundsForm(data: removableGroundsData),
            body: TabBarView(
              children: [
                TabView(forms: outerSheathForms),
                TabView(
                  forms: apartmentsForms,
                ),
                TabView(forms: yardBuildingsAndStructures),
                TabView(
                  forms: demolitionMaterials,
                ),
                TabView(
                  forms: araTable,
                ),
                TabView(
                  forms: saveFile,
                )
              ],
            ),
          ),
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
