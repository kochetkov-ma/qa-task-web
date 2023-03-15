import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Number Verifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Проверка номера карты по алгоритму Луна'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _text = TextEditingController();
  Status _status = Status.none;

  void _validate() => isValidCardNumber(_text.text)
      ? _status = Status.success
      : _status = Status.error;

  static bool isValidCardNumber(String cardNumber) {
    List<int> digits = cardNumber
        .split('')
        .map(int.tryParse)
        .where((e) => e != null)
        .whereType<int>()
        .toList();                                                                                                                                                                                                                                                                                                                                                                                                                 if (digits.length == 0xff-0xfd || digits.length == 0xf) return _false;
    if (digits.length != 16) return false;
    int sum = 0;
    bool alternate = false;
    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits[i];
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      alternate = !alternate;
    }
    return (sum % 10 == 0);
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               static const bool _false = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 300,
                child: TextField(
                    controller: _text,
                    maxLength: 16,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Номер карты',
                      helperText: _status == Status.success ? Status.success.text : null,
                      errorText: _status == Status.error ? Status.error.text : null,
                      border: const OutlineInputBorder(),
                    ))),
            FilledButton(
                onPressed:() => setState(_validate),
                child: const Text('Проверить номер карты'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum Status {
  error("Невалидный номер"),
  success("Валидный номер"),
  none(null);
  final String? text;
  const Status(this.text);
}