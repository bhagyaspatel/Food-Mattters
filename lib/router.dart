import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_matters/auth/screens/otp_screen.dart';
import 'package:foods_matters/route/features/food_services/screens/post_food.dart';
import 'package:foods_matters/route/features/user_services/screens/hostel/ngo_details_screen.dart';
import 'package:foods_matters/route/features/user_services/screens/hostel/search_screen.dart';
import 'package:foods_matters/route/features/user_services/screens/common/update_location.dart';
import 'package:foods_matters/route/features/user_services/screens/common/user_registration.dart';
import 'package:foods_matters/route/features/volunteer_services/screens/delivery_screen.dart';
import 'package:foods_matters/route/widgets/hostel/p_bottom_bar.dart';
import 'package:foods_matters/route/widgets/ngo/c_bottom_bar.dart';
import 'package:foods_matters/route/widgets/volunteer/v_bottom_bar.dart';
import 'package:foods_matters/screens/error_screen.dart';
import 'package:foods_matters/screens/home_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'auth/screens/otp_verification_screen.dart';
import './models/user_model.dart';
import 'route/widgets/ngo/c_bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OTPScreen.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const OTPScreen(),
      );

    case OTPVerificationScreen.routeName:
      final verificationId = settings.arguments as String;
      return CupertinoPageRoute(
        builder: (ctx) => OTPVerificationScreen(
          verificationId: verificationId,
        ),
      );

    case HomeScreen.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const HomeScreen(),
      );

    case PostFood.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const PostFood(),
      );

    case RegistrationScreen.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const RegistrationScreen(),
      );

    case V_BottomBar.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const V_BottomBar(),
      );
    case P_BottomBar.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const P_BottomBar(),
      );
    case C_BottomBar.routeName:
      return CupertinoPageRoute(
        builder: (ctx) => const C_BottomBar(),
      );

    case DeliveryScreen.routeName:
      final initalCoordinates = settings.arguments as LatLng;
      return CupertinoPageRoute(
        builder: (ctx) => DeliveryScreen(initalCoordinates),
      );

    case SearchedResults.routeName:
      final query = settings.arguments as String;
      return CupertinoPageRoute(
        builder: (ctx) => SearchedResults(
          q: query,
        ),
      );

    case NgoDetails.routeName:
      final user = settings.arguments as User;
      return CupertinoPageRoute(
        builder: (ctx) => NgoDetails(user),
      );

    case UpdateLocationScreen.routeName:
      final coordinates = settings.arguments as LatLng;
      return CupertinoPageRoute(
        builder: (ctx) => UpdateLocationScreen(coordinates),
      );

    default:
      return CupertinoPageRoute(
        builder: (ctx) => const Scaffold(
          body: ErrorScreen(
            error: 'This page doesn\'t exist',
          ),
        ),
      );
  }
}
