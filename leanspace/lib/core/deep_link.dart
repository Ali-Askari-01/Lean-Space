/// Parsed result from a `leanspace://` URI.
class DeepLinkAction {
  const DeepLinkAction({
    required this.path,
    this.showWidgetSetup = false,
    this.addTask = false,
    this.referralCode,
  });

  final String path;
  final bool showWidgetSetup;
  final bool addTask;
  final String? referralCode;
}

/// Parses `leanspace://` URIs before go_router tries to match them.
DeepLinkAction? parseDeepLink(Uri uri) {
  if (uri.scheme != 'leanspace') return null;

  switch (uri.host) {
    case 'shortcut':
      return DeepLinkAction(
        path: '/my-day',
        showWidgetSetup: uri.path == '/add-widget',
      );
    case 'add-task':
      return const DeepLinkAction(path: '/my-day', addTask: true);
    case 'refer':
      final code = uri.queryParameters['code'];
      if (code != null && code.trim().isNotEmpty) {
        return DeepLinkAction(path: '/auth', referralCode: code.trim());
      }
      return const DeepLinkAction(path: '/auth');
  }

  return const DeepLinkAction(path: '/my-day');
}