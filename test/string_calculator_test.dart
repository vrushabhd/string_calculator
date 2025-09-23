import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    final calc = StringCalculator();

    test('empty string returns 0', () {
      expect(calc.add(''), 0);
    });

    test('single number', () {
      expect(calc.add('1'), 1);
    });

    test('two numbers comma separated', () {
      expect(calc.add('1,5'), 6);
    });

    test('handle new lines', () {
      expect(calc.add('1\n2,3'), 6);
    });

    test('custom delimiter', () {
      expect(calc.add('//;\n1;2'), 3);
    });

    test('multi-char delimiter in brackets', () {
      expect(calc.add('//[***]\n1***2***3'), 6);
    });

    test('multiple delimiters', () {
      expect(calc.add('//[*][%]\n1*2%3'), 6);
    });

    test('ignore numbers > 1000', () {
      expect(calc.add('2,1001,3'), 5);
    });

    test('negative numbers throw', () {
      expect(() => calc.add('1,-2,3,-4'), throwsA(isA<NegativeNumbersException>()));
      try {
        calc.add('1,-2,3,-4');
      } catch (e) {
        expect(e.toString(), contains('negative numbers not allowed -2,-4'));
      }
    });
  });
}
