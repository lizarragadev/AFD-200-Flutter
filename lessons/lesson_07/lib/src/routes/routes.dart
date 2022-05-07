
import 'package:flutter/material.dart';
import 'package:lesson_07/src/pages/bottom_nav_bar_page.dart';
import 'package:lesson_07/src/pages/data_tables_page.dart';
import 'package:lesson_07/src/pages/drawers_page.dart';
import 'package:lesson_07/src/pages/home_page.dart';
import 'package:lesson_07/src/pages/listview_listtiles_page.dart';
import 'package:lesson_07/src/pages/selectable_text_page.dart';
import 'package:lesson_07/src/pages/stacks_page.dart';
import 'package:lesson_07/src/pages/tab_bars_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    '/': (context) => HomePage(),
    '/bottomNav': (context) => const BottomNavBarPage(),
    '/tabs': (context) => const TabBarsPage(),
    '/drawers': (context) => const DrawersPage(),
    '/listView': (context) => const ListViewListTilesPage(),
    '/dataTable': (context) => DataTablePage(),
    '/selectableText': (context) => const SelectableTextPage(),
    '/stack': (context) => const StacksPage(),
  };
}