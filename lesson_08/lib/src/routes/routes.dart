
import 'package:flutter/cupertino.dart';
import 'package:lesson_08/src/pages/bottom_sheet_page.dart';
import 'package:lesson_08/src/pages/checkbox_radiobutton_page.dart';
import 'package:lesson_08/src/pages/expansion_panel_page.dart';
import 'package:lesson_08/src/pages/home_page.dart';
import 'package:lesson_08/src/pages/pickers_dialog_page.dart';
import 'package:lesson_08/src/pages/slider_switch_page.dart';
import 'package:lesson_08/src/pages/text_fields_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
      '/': (context) => HomePage(),
      '/textFields': (context) => TextFieldsPage(),
      '/checkRadio': (context) => CheckBoxRadioButtonPage(),
      '/pickers': (context) => PickersDialogPage(),
      '/sliderSwitch': (context) => SliderSwitchPage(),
      '/bottomSheet': (context) => BottomSheetPage(),
      '/expansionPanel': (context) => ExpansionPanelPage(),
  };
}