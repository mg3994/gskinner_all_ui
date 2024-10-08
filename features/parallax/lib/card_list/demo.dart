import 'package:flutter/material.dart';

import 'demo_data.dart';
import 'hotel_list.dart';
import 'styles.dart';
import 'travel_card_list.dart';

class TravelCardDemo extends StatefulWidget {
  const TravelCardDemo({super.key});

  static const routePath = '/travel-card-demo';

  static Route<void> route(RouteSettings? settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => const TravelCardDemo(
              
            ));
  }

  @override
State createState() => _TravelCardDemoState();
}

class _TravelCardDemoState extends State<TravelCardDemo> {
  static final data = DemoData();
  static final _cityList = data.getCities();
  City _currentCity = _cityList[1];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
                child: Text(
                  'Where are you going next?',
                  overflow: TextOverflow.ellipsis,
                  style: Styles.appHeader,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TravelCardList(
                  cities: _cityList,
                  onCityChange: _handleCityChange,
                ),
              ),
              HotelList(_currentCity.hotels),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCityChange(City city) {
    setState(() {
      _currentCity = city;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: const Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        )
      ],
    );
  }
}
