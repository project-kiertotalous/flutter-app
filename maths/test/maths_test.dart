import 'package:flutter_test/flutter_test.dart';

import 'package:maths/maths.dart';

void main() {
  test('adds one to input values', () {
    expect(Calculator.sum(2, 3), 5);
  });
}
