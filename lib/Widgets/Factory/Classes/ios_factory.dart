import 'package:flutter/material.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/add_button.dart';
import 'package:money_counter/Widgets/Elements/add_button_widget.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:money_counter/Widgets/Elements/choose_button_widget.dart';
import 'package:money_counter/Widgets/Elements/page_scaffold_widget.dart';
import 'package:money_counter/Widgets/Factory/Interfaces/abstract_factory.dart';


class IOSFactory implements Factory{

  @override
  AddButton getAddButton(
    DateTime? transactionDate, 
    TextEditingController countEditController, 
    TextEditingController titleEditController,) {
    return IOSAddButtonWidget(
      countEditController: countEditController, 
      titleEditController: titleEditController);
    }

  @override
  CrossAxisAlignment getAddButtonPosition() {
    return CrossAxisAlignment.center;
  }

  @override
  ChooseButton getChooseButton(Function(DateTime?) callBack) {
    return IOSChooseButtonWidget(callBack);
  }

  @override
  PageScaffold getPageScaffold(Widget pageBody) {
    return PageIOSScaffoldWidget(pageBody: pageBody);
  }
}