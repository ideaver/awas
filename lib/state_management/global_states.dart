import 'package:flutter_riverpod/flutter_riverpod.dart';

final termsChecked = StateProvider.autoDispose<bool>((ref) => false);
