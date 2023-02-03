import 'package:flutter_riverpod/flutter_riverpod.dart';

final isNewUserProvider = StateProvider.autoDispose<bool>((ref) => true);
final termsCheckedProvider = StateProvider.autoDispose<bool>((ref) => false);
final isFabVisibleProvider =
    StateProvider.autoDispose<bool>((ref) => false); //TODO: Fix fab visible
final searchingProvider = StateProvider.autoDispose((ref) => false);
