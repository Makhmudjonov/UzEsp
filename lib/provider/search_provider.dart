import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  Set order = {};
  Set img = {};
  Set bolimSearch = {};
  chiqar(String v, List<dynamic> doc, List bolim1) {
    order.clear();
    order.clear();
    img.clear();
    bolimSearch.clear();
    for (var i = 0; i < doc.length; i++) {
      if ((doc[i]["name"] as String).toLowerCase().contains(v)) {
        order.add(doc[i]["name"]);
        img.add(doc[i]["img"]);
        bolimSearch.add(bolim1[i]);
      }
    }
    if (v.isEmpty) {
      order.clear();
      order.clear();
      img.clear();
    }

    notifyListeners();
  }
}
