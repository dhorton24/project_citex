import 'package:flutter/material.dart';
import 'package:project_citex/Screens/ContactScreens/ContactScreenController.dart';
import 'package:project_citex/Screens/ServicesScreen/ServicesScreenController.dart';
import 'package:project_citex/main.dart';
import 'package:project_citex/route/pageNotifier.dart';
import 'package:project_citex/route/route.dart';

import '../enums.dart';


class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final PageNotifier notifier;

  AppRouterDelegate({required this.notifier});

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (notifier.isUnknown)
            const MaterialPage(
                child: Scaffold(
              body: Text('Unknown'),
            )),
          if (!notifier.isUnknown) const MaterialPage(child: MyHomePage()),
          if (notifier.pageName == PageName.home)
            const MaterialPage(child: MyHomePage()),
          if (notifier.pageName == PageName.contact)
            const MaterialPage(child: ContactScreenController()),
          if (notifier.pageName == PageName.services)
            const MaterialPage(child: ServicesScreenController())
        ],
        onPopPage: (route, result) => route.didPop(result));
  }

//currentConfiguration is called whenever there might be a change in route
//It checks for the current page or route and return a new route information
//This is what populates our browser history
  @override
  AppRoute? get currentConfiguration {
    if (notifier.isUnknown) {
      return AppRoute.unknown();
    }

    if (notifier.pageName == PageName.home) {
      return AppRoute.home();
    }

    if (notifier.pageName == PageName.services) {
      return AppRoute.services();
    }

    if (notifier.pageName == PageName.contact) {
      return AppRoute.contact();
    }

    if (notifier.pageName == PageName.services) {
      return AppRoute.services();
    }

    return AppRoute.unknown();
  }

//This is called whenever the system detects a new route is passed
//It checks the current route through the configuration and uses that to update the notifier
  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    if (configuration.isUnknown) {
      _updateRoute(page: null, isUnknown: true);
    }

    if (configuration.isContact) {
      _updateRoute(page: PageName.contact);
    }

    if (configuration.isContact) {
      _updateRoute(page: PageName.contact);
    }

    if (configuration.isServices) {
      _updateRoute(page: PageName.services);
    }

    if (configuration.isHome) {
      _updateRoute(page: PageName.home);
    }
  }

  _updateRoute({PageName? page, bool isUnknown = false}) {
    notifier.changePage(page: page, unknown: isUnknown);
  }
}