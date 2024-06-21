import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:whatsapp/theme_changer.dart";

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text('dark Mode'),
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
              value: ThemeMode.dark),
          RadioListTile<ThemeMode>(
              title: const Text('light Mode'),
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
              value: ThemeMode.light)
        ],
      ),
    );
  }
}
