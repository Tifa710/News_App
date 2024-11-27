import 'package:flutter/material.dart';
import 'LanguageSheet.dart';

class Setting extends StatefulWidget {
  static const String routeName = 'setting';

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Language',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black)),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  showLangbottomSheet();
                },
                child: Text(
                  'English',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              )),
        ],
      ),
    );
  }

  void showLangbottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=> LanguageSheet());

  }
}
