/// Parsed result from a `leanspace://` URI.
class DeepLinkAction {
  const DeepLinkAction({
    required this.path,
    this.showWidgetSetup = false,
    this.addTask = false,
  });

  final String path;
  final bool showWidgetSetup;
  final bool addTask;
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
  }

  return const DeepLinkAction(path: '/my-day');
}