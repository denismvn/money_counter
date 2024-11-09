import 'package:flutter/widgets.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/add_button.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/page_scaffold.dart';

abstract class Factory {
  PageScaffold getPageScaffold(Widget pageBody);
  AddButton getAddButton(
    DateTime? transactionDate, 
    TextEditingController countEditController, 
    TextEditingController titleEditController,
  );
  ChooseButton getChooseButton(Function(DateTime?) callBack);
  CrossAxisAlignment getAddButtonPosition(); 
}