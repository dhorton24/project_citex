

import '../enums.dart';

class AppRoute{

  final PageName? pageName;
  final bool _isUnknown;

  AppRoute.home()
  :pageName = PageName.home,
  _isUnknown = false;

  AppRoute.contact()
  :pageName = PageName.contact,
  _isUnknown = false;

  AppRoute.services()
  :pageName = PageName.services,
  _isUnknown = false;

  AppRoute.meetTeam()
  :pageName = PageName.meetTeam,
  _isUnknown = false;

  AppRoute.unknown()
  :pageName = null,
  _isUnknown = true;

  //Used to get the current path
bool get isHome => pageName == PageName.home;
bool get isContact => pageName == PageName.contact;
bool get isServices => pageName == PageName.services;
bool get isMeetTeam => pageName == PageName.meetTeam;
bool get isUnknown => _isUnknown;
}