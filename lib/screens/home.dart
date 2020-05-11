import 'package:flutter/material.dart';
import 'package:neverendinggestures/common/app_strings.dart';
import 'package:neverendinggestures/widgets/counter_style.dart';
import 'package:neverendinggestures/widgets/gestures_area.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> _counters = <int>[];
  GestureType _gestureType = GestureType.tap;
  final CounterStyle _counterStyle = CounterStyle();

  @override
  void initState() {
    super.initState();
    _counters.add(0);
    _counters.add(0);
  }

  void _doShuffleStyles() {
    setState(() {
      _counterStyle.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
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
            ListTile(
              title: Text(AppStrings.drawerTapTitle),
              onTap: () {
                setState(() {
                  _gestureType = GestureType.tap;
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(AppStrings.drawerDoubleTapTitle),
              onTap: () {
                setState(() {
                  _gestureType = GestureType.doubleTap;
                });

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: GesturesArea(
        counter: _counters[_gestureType.index],
        gestureType: _gestureType,
        onGesture: () {
          setState(() {
            _counters[_gestureType.index]++;
          });
        },
        counterStyle: _counterStyle,
      ),
    );
  }
}
