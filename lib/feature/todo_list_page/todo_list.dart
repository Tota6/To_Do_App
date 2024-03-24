import 'package:flutter/material.dart';

import '../../config/themes/app_colors.dart';

class ToDoListTab extends StatelessWidget {
  static const String routeName = "ToDoListTab";

  const ToDoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
    );
  }
}
