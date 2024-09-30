import 'package:basketball/demo.dart';
import 'package:bubble/demo.dart';
import 'package:constellations/demo.dart';
import 'package:dark_ink/demo.dart';
import 'package:dog_slider/demo.dart';
import 'package:drink_reward/demo.dart';
import 'package:ecom/demo.dart';
import 'package:fluid/demo.dart';
import 'package:flutter/material.dart';
import 'package:gooey/demo.dart';
import 'package:indie/demo.dart';
import 'package:parallax/card_hero/demo.dart';
import 'package:parallax/card_list/demo.dart';
import 'package:particle/demo.dart';
import 'package:plant/demo.dart';
import 'package:sparkle/demo.dart';
import 'package:spending/demo.dart';
import 'package:ticket/demo.dart';

import '../features/home_Screen.dart';

class Routes {
  static const List<String> routesPath = [
    home,
    basketball,
    bubble,
    constellations,
    dark_ink,
    dog_slider,
    drink_reward,
    ecom,
    fluid,
    gooey,
    indie,
    parallax1,
    parallax2,
    particle,
    plant,
    sparkle,
    spending,
    ticket,
  ];
  static const String home = '/';
  static const String basketball = BasketballPTRDemo.routePath;
  static const String bubble = BubbleTabBarDemo.routePath;
  static const String constellations = ConstellationsListDemo.routePath;
  static const String dark_ink = DarkInkDemo.routePath;
  static const String dog_slider = DogSliderDemo.routePath;
  static const String drink_reward = DrinkRewardsListDemo.routePath;
  static const String ecom = ProductDetailZoomDemo.routePath;
  static const String fluid = FluidNavBarDemo.routePath;
  static const String gooey = GooeyEdgeDemo.routePath;
  static const String indie = Indie3dHome.routePath;
  static const String parallax1 = HeroCardDemo.routePath;
  static const String parallax2 = TravelCardDemo.routePath;
  static const String particle = ParticleSwipeDemo.routePath;
  static const String plant = PlantFormsDemo.routePath;
  static const String sparkle = SparklePartyDemo.routePath;
  static const String spending = SpendingTrackerDemo.routePath;
  static const String ticket = TicketFoldDemo.routePath;
}

class AppRoutes {
  static const String initial = Routes.home;

  static String getInitialRoute() => initial;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;
    switch (name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.basketball:
        return BasketballPTRDemo.route(settings);
      case Routes.bubble:
        return BubbleTabBarDemo.route(settings);
      case Routes.constellations:
        return ConstellationsListDemo.route(settings);
      case Routes.dark_ink:
        return DarkInkDemo.route(settings);
      case Routes.dog_slider:
        return DogSliderDemo.route(settings);
      case Routes.drink_reward:
        return DrinkRewardsListDemo.route(settings);
      case Routes.ecom:
        return ProductDetailZoomDemo.route(settings);
      case Routes.fluid:
        return FluidNavBarDemo.route(settings);
      case Routes.gooey:
        return GooeyEdgeDemo.route(settings);
      case Routes.indie:
        return Indie3dHome.route(settings);
      case Routes.parallax1:
        return HeroCardDemo.route(settings);
      case Routes.parallax2:
        return TravelCardDemo.route(settings);
      case Routes.particle:
        return ParticleSwipeDemo.route(settings);
      case Routes.plant:
        return PlantFormsDemo.route(settings);
      case Routes.sparkle:
        return SparklePartyDemo.route(settings);
      case Routes.spending:
        return SpendingTrackerDemo.route(settings);
      case Routes.ticket:
        return TicketFoldDemo.route(settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for $name'))));
    }
  }
}
