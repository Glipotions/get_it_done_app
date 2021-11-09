import 'package:flutter/material.dart';
import 'package:get_it_done_app/models/color_theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tema Seçimi Yapınız'),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SwitchCard());
  }
}

class SwitchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text greenText =
        Text('Yeşil', style: TextStyle(color: Theme.of(context).primaryColor));
    Text redText = Text('Kırmızı',
        style: TextStyle(color: Theme.of(context).primaryColor));
    bool _value = Provider.of<ColorThemeData>(context).isGreen;
    return Card(
      child: SwitchListTile(
        subtitle: _value ? greenText : redText,
        title: const Text(
          'Temanın Rengini Değiştir',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
