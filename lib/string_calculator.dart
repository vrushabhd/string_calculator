class NegativeNumbersException implements Exception {
  final List<int> negatives;
  NegativeNumbersException(this.negatives);

  @override
  String toString() => 'negative numbers not allowed ${negatives.join(',')}';
}

class StringCalculator {
  /// Adds numbers in the input string according to the kata rules.
  int add(String numbers) {
    if (numbers == null || numbers.isEmpty) return 0;

    // Custom delimiter
    String nums = numbers;
    String delimiterPattern = ',|\\n';

    if (nums.startsWith('//')) {
      // format: //[delimiter]\n[numbers]
      final newlineIndex = nums.indexOf('\n');
      if (newlineIndex == -1) {
        // malformed - treat entire string after // as numbers
        nums = nums.substring(2);
      } else {
        final delimSpec = nums.substring(2, newlineIndex);
        // support single-character delimiter like ; or multi char inside []
        if (delimSpec.startsWith('[') && delimSpec.endsWith(']')) {
          // could be multiple delimiters nested like [***][%]
          final matches = RegExp(r"\[(.*?)\]").allMatches(delimSpec);
          final delims = matches.map((m) => RegExp.escape(m.group(1)!)).join('|');
          delimiterPattern = delims;
        } else {
          delimiterPattern = RegExp.escape(delimSpec);
        }
        nums = nums.substring(newlineIndex + 1);
      }
    }

    final parts = nums.split(RegExp(delimiterPattern));
    final negatives = <int>[];
    var sum = 0;
    for (final p in parts) {
      if (p.trim().isEmpty) continue;
      final v = int.tryParse(p.trim());
      if (v == null) continue; // ignore non-numeric pieces
      if (v < 0) negatives.add(v);
  // ignore numbers greater than 1000 as an extra (common kata rule)
  if (v > 1000) continue;
  sum += v;
    }

    if (negatives.isNotEmpty) {
      throw NegativeNumbersException(negatives);
    }

    return sum;
  }
}
