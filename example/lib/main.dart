import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_text_button/cupertino_text_button.dart';

void main() {
  runApp(const MyApp());
}

const title = 'Cupertino Text Button Example';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _noConfigurationCounter = 0;
  int _withoutThemeCounter = 0;
  int _withThemeCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button without any configuration:',
                style: const TextStyle(fontSize: 17),
              ),
              CupertinoTextButton(
                text: 'You pressed this button $_noConfigurationCounter times',
                style: const TextStyle(fontSize: 20),
                onTap: () {
                  setState(() {
                    _noConfigurationCounter++;
                  });
                },
              ),
              const SizedBox(height: 40),
              Text(
                'Button without theme:',
                style: const TextStyle(fontSize: 17),
              ),
              CupertinoTextButton(
                color: Colors.purple,
                pressedColor: Colors.orange,
                text: 'You pressed this button $_withoutThemeCounter times',
                style: const TextStyle(fontSize: 20),
                onTap: () {
                  setState(() {
                    _withoutThemeCounter++;
                  });
                },
              ),
              const SizedBox(height: 40),
              Text(
                'Button with theme:',
                style: const TextStyle(fontSize: 17),
              ),
              CupertinoTextButtonTheme(
                color: Colors.red,
                pressedColor: Colors.lime,
                forwardDuration: Duration(seconds: 1),
                child: CupertinoTextButton(
                  text: 'You pressed this button $_withThemeCounter times',
                  style: const TextStyle(fontSize: 20),
                  onTap: () {
                    setState(() {
                      _withThemeCounter++;
                    });
                  },
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Icon buttons:',
                style: const TextStyle(fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoTextButton.icon(
                    icon: Icons.add,
                    size: 50,
                    onTap: () {
                      debugPrint('First Icon button tapped!');
                    },
                  ),
                  const SizedBox(width: 20),
                  CupertinoTextButton.icon(
                    icon: CupertinoIcons.add_circled,
                    size: 50,
                    onTap: () {
                      debugPrint('Second Icon button tapped!');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
