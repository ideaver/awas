import 'package:flutter_riverpod/flutter_riverpod.dart';

final isNewUser = StateProvider.autoDispose<bool>((ref) => true);
final termsChecked = StateProvider.autoDispose<bool>((ref) => false);
final isFabVisible =
    StateProvider.autoDispose<bool>((ref) => false);//TODO: Fix fab visible
