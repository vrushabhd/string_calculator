import 'package:flutter/material.dart';
import 'string_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator',
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = TextEditingController();
  final _calculator = StringCalculator();
  String _result = '';

  void _compute() {
    try {
      final res = _calculator.add(_controller.text);
      setState(() {
        _result = res.toString();
      });
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter numbers',
                hintText: 'e.g. 1,2,3 or //;\n1;2',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _compute, child: const Text('Add')),
            const SizedBox(height: 12),
            Text('Result: $_result'),
          ],
        ),
      ),
    );
  }
}
