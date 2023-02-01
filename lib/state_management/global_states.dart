import 'package:flutter_riverpod/flutter_riverpod.dart';

final isNewUser = StateProvider.autoDispose<bool>((ref) => false);
final termsChecked = StateProvider.autoDispose<bool>((ref) => false);
