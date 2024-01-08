

import 'package:flutter/cupertino.dart';
import 'package:project_citex/route/route.dart';

import '../enums.dart';

String? _unknownPath;

class AppRouteInformationParser extends RouteInformationParser<AppRoute>{

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async{

   final uri = Uri.parse(routeInformation.uri.path);

   if(uri.pathSegments.isEmpty){
     return AppRoute.home();
   }

   if(uri.pathSegments.length > 1){
     _unknownPath = routeInformation.uri.path;
     return AppRoute.unknown();
   }

   if (uri.pathSegments.length == 1) {
     if (uri.pathSegments.first == PageName.home.name) {
       return AppRoute.home();
     }

     if (uri.pathSegments.first == PageName.contact.name) {
       return AppRoute.contact();
     }

     if (uri.pathSegments.first == PageName.services.name) {
       return AppRoute.services();
     }
     if (uri.pathSegments.first == PageName.meetTeam.name) {
       return AppRoute.meetTeam();
     }
   }

   _unknownPath = uri.path;
   return AppRoute.unknown();
  }



    @override
    RouteInformation? restoreRouteInformation(AppRoute configuration) {
      if (configuration.isHome) {
        return _getRouteInformation(configuration.pageName!.name);
      }

      if (configuration.isUnknown) {
        return RouteInformation(uri: Uri.parse(_unknownPath!));
      }

      if (configuration.isContact) {
        return _getRouteInformation(configuration.pageName!.name);
      }

      if (configuration.isServices) {
        return _getRouteInformation(configuration.pageName!.name);
      }

      return  RouteInformation(uri: Uri.parse("/"));
    }

//Get Route Information depending on the PageName passed

  }

  RouteInformation _getRouteInformation(String page) {
    return RouteInformation(uri: Uri.parse("/$page"));

  }


