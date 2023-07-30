import 'package:flutter/material.dart';

class BottomNav {
  Icon? icon;
  String? title;
  BottomNav({this.icon, this.title});
}

List<BottomNav> navs = [
  BottomNav(icon: const Icon(Icons.notes), title: 'notes'),
  BottomNav(icon: const Icon(Icons.home), title: 'home'),
  BottomNav(icon: const Icon(Icons.settings), title: 'settings'),
];
