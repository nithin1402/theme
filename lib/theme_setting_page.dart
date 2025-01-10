import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/theme_provider.dart';

class ThemeSettingPage extends StatefulWidget {
  const ThemeSettingPage({super.key});

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Page",style: Theme.of(context).textTheme.bodyLarge,),
      ),
      body: Center(
        child: SwitchListTile.adaptive(
          title: Text("Dark Theme"),
            value: context.watch<ThemeProvider>().getThemeValue(), onChanged: (value){
          context.read<ThemeProvider>().setDarkTheme(value);
        }),
      ),
    );
  }
}
