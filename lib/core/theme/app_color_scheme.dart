import 'package:flutter/material.dart';

enum AppColorScheme {
  ocean(Color(0xFF1565C0), 'Ocean'),
  sunset(Color(0xFFE65100), 'Sunset'),
  forest(Color(0xFF2E7D32), 'Forest'),
  lavender(Color(0xFF7B1FA2), 'Lavender'),
  charcoal(Color(0xFF455A64), 'Charcoal'),
  coral(Color(0xFFD84315), 'Coral');

  final Color seed;
  final String label;
  const AppColorScheme(this.seed, this.label);
}
