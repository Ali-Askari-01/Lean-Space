import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks whether Supabase has finished initializing.
/// The router redirect gates on this to avoid accessing
/// Supabase.instance.client before it is ready.
class SupabaseReadyNotifier extends ChangeNotifier {
  bool _ready = false;
  bool get isReady => _ready;

  void markReady() {
    if (!_ready) {
      _ready = true;
      notifyListeners();
    }
  }
}

final supabaseReadyProvider = Provider<SupabaseReadyNotifier>((ref) {
  final notifier = SupabaseReadyNotifier();
  ref.onDispose(notifier.dispose);
  return notifier;
});
