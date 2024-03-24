import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/widgets/custom_text_field_theme.dart';
import 'package:todo_app/core/widgets/custome_text_form_languge.dart';
import '../../core/provider/setting_provider.dart';

class SettingTab extends StatefulWidget {
  static const String routeName = "SettingTab";
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: provider.currentTheme == ThemeMode.dark
                ? Theme.of(context).textTheme.titleSmall
                : Theme.of(context).textTheme.titleSmall,
          ),
          GestureDetector(
            onTap: () {},
            child: const CustomTextFieldLanguage(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Mode",
            style: provider.currentTheme == ThemeMode.dark
                ? Theme.of(context).textTheme.titleSmall
                : Theme.of(context).textTheme.titleSmall,
          ),
          const CustomTextFieldTheme(),
        ],
      ),
    );
  }
}
