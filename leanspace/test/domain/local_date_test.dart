import 'package:flutter_test/flutter_test.dart';
import 'package:daily_stitch/core/local_date.dart';

void main() {
  group('LocalDate.parseIsoDate', () {
    test('returns null for null input', () {
      expect(LocalDate.parseIsoDate(null), isNull);
    });

    test('returns null for empty string', () {
      expect(LocalDate.parseIsoDate(''), isNull);
    });

    test('returns null for malformed input', () {
      expect(LocalDate.parseIsoDate('garbage'), isNull);
      expect(LocalDate.parseIsoDate('2026-07'), isNull);
      expect(LocalDate.parseIsoDate('2026-07-22-extra'), isNull);
    });

    test('returns null for invalid date components', () {
      expect(LocalDate.parseIsoDate('abcd-ef-gh'), isNull);
    });

    test('parses valid date correctly', () {
      final result = LocalDate.parseIsoDate('2026-07-22');
      expect(result, isNotNull);
      expect(result!.year, 2026);
      expect(result.month, 7);
      expect(result.day, 22);
    });

    test('parses date with leading zeros', () {
      final result = LocalDate.parseIsoDate('2026-01-05');
      expect(result, isNotNull);
      expect(result!.year, 2026);
      expect(result.month, 1);
      expect(result.day, 5);
    });
  });

  group('LocalDate.isSameDay', () {
    test('returns true for same date different time', () {
      final a = DateTime(2026, 7, 22, 10, 30);
      final b = DateTime(2026, 7, 22, 15, 45);
      expect(LocalDate.isSameDay(a, b), isTrue);
    });

    test('returns false for different dates', () {
      final a = DateTime(2026, 7, 22);
      final b = DateTime(2026, 7, 23);
      expect(LocalDate.isSameDay(a, b), isFalse);
    });

    test('returns true for same date', () {
      final a = DateTime(2026, 7, 22);
      final b = DateTime(2026, 7, 22);
      expect(LocalDate.isSameDay(a, b), isTrue);
    });
  });

  group('LocalDate.toIsoDate', () {
    test('formats date correctly', () {
      final date = DateTime(2026, 7, 22);
      expect(LocalDate.toIsoDate(date), '2026-07-22');
    });

    test('pads single digit month and day', () {
      final date = DateTime(2026, 1, 5);
      expect(LocalDate.toIsoDate(date), '2026-01-05');
    });
  });

  group('LocalDate.yesterday', () {
    test('returns previous day', () {
      final date = DateTime(2026, 7, 22);
      final result = LocalDate.yesterday(date);
      expect(result.year, 2026);
      expect(result.month, 7);
      expect(result.day, 21);
    });

    test('handles month boundary', () {
      final date = DateTime(2026, 8, 1);
      final result = LocalDate.yesterday(date);
      expect(result.year, 2026);
      expect(result.month, 7);
      expect(result.day, 31);
    });
  });
}
