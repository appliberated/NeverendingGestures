import 'package:flutter/material.dart';
import 'package:neverendinggestures/common/app_strings.dart';
import 'package:neverendinggestures/common/settings_provider.dart';
import 'package:neverendinggestures/widgets/counter_style.dart';
import 'package:neverendinggestures/widgets/gestures_area.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The current counter values for each gesture type
  Map<GestureType, int> _counters = Map<GestureType, int>();

  /// Current gesture type
  GestureType _gestureType = GestureType.tap;

  /// The applied counter style
  final CounterStyle _counterStyle = CounterStyle();

  _HomeScreenState() {
    // Init counters to 0
    GestureType.values.forEach((type) => _counters[type] = 0);
  }

  @override
  void initState() {
    super.initState();
    _initCounters();
  }

  Future<void> _initCounters() async {
    await SettingsProvider.getCounters(_counters);
    setState(() {});
  }

  void _doShuffleStyles() {
    setState(() {
      _counterStyle.shuffle();
    });
  }

  void _onDrawerGestureTap(GestureType gestureType) {
    setState(() {
      _gestureType = gestureType;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(AppStrings.appName),
        title: Text(AppStrings.gestureDrawerTitles[_gestureType]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.style),
            onPressed: _doShuffleStyles,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(AppStrings.drawerTitle),
            ),
            ...GestureType.values.map((type) => ListTile(
                  title: Text(AppStrings.gestureDrawerTitles[type]),
                  onTap: () => _onDrawerGestureTap(type),
                )),
          ],
        ),
      ),
      body: GesturesArea(
        counter: _counters[_gestureType],
        gestureType: _gestureType,
        onGesture: () {
          setState(() {
            _counters[_gestureType]++;
          });
          SettingsProvider.setCounters(_counters);
        },
        counterStyle: _counterStyle,
      ),
    );
  }
}
