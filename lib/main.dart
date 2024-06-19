import 'package:flutter/material.dart';
import 'package:kids_game/screen/provider/home_provider.dart';
import 'package:kids_game/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
    ),
  );
}
