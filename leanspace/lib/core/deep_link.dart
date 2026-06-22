/// Parsed result from a `leanspace://` URI.
class DeepLinkAction {
  const DeepLinkAction({
    required this.path,
    this.showWidgetSetup = false,
    this.addTask = false,
    this.buddyInviteCode,
  });

  final String path;
  final bool showWidgetSetup;
  final bool addTask;
  final String? buddyInviteCode;
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
    case 'buddy':
      final code = uri.queryParameters['code'];
      if (code != null && code.isNotEmpty) {
        return DeepLinkAction(path: '/our-space', buddyInviteCode: code);
      }
      return const DeepLinkAction(path: '/our-space');
  }

  return const DeepLinkAction(path: '/my-day');
}