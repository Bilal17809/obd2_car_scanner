
import 'dart:ui';

extension ColorExtension on Color {
  String get hexString {
    return '#${toARGB32().toRadixString(16).substring(2, 8)}';
  }
}
