import 'package:flutter/material.dart';
import 'package:kids_game/screen/model/home_model.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> qua = [
    HomeModel(image: "🥔", key: "Potato"),
    HomeModel(image: "🍎", key: "Apple"),
    HomeModel(image: "🍅", key: "Tomato"),
    HomeModel(image: "🥝", key: "Kiwi"),
  ];

  List<HomeModel> ans = [
    HomeModel(name: "Apple", key: "Apple", drop: "🍎 Apple"),
    HomeModel(name: "Potato", key: "Potato", drop: "🥔 Potato"),
    HomeModel(name: "Kiwi", key: "Kiwi", drop: "🥝 Kiwi"),
    HomeModel(name: "Tomato", key: "Tomato", drop: "🍅 Tomato"),
  ];

  void changeDrag(int index) {
    ans[index].isDrop = true;
    notifyListeners();
  }
}
