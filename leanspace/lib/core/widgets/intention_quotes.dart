import 'dart:math';

/// Rotating motivational lines shown in the "Plant an intention" hero card
/// at the top of the add-task sheet. A new line is shown every time the
/// sheet is opened.
class IntentionQuotes {
  const IntentionQuotes._();

  static const List<_IntentionQuote> _all = [
    _IntentionQuote(
      title: "Let's plant a new intention!",
      body:
          "Every mighty forest begins with a single tiny choice. Tell me what we're nurturing today?",
    ),
    _IntentionQuote(
      title: "What shall we grow today?",
      body:
          "Tiny seeds, tended with care, become tall trees. Pick the one that matters most right now.",
    ),
    _IntentionQuote(
      title: "One seed. One breath. Begin.",
      body:
          "You don't have to plant the whole forest at once — just the next right thing.",
    ),
    _IntentionQuote(
      title: "Nurture the next small step.",
      body:
          "Future-you is built from the choices you make in the next five minutes. What's one kind one?",
    ),
    _IntentionQuote(
      title: "Choose what you want to become.",
      body:
          "Tasks are seeds, habits are sprouts. Together they form a forest you're proud of.",
    ),
    _IntentionQuote(
      title: "Plant something worth remembering.",
      body:
          "Not every day will feel huge. A watered seed still counts. Let's name one.",
    ),
    _IntentionQuote(
      title: "Make today a little braver.",
      body:
          "Courage compounds. Pick the seed you've been postponing — even naming it moves it forward.",
    ),
    _IntentionQuote(
      title: "Tend the soil before the seed.",
      body:
          "What mindset, tool, or small ritual will make this task easier? Add it to the notes.",
    ),
  ];

  /// Returns a [title, body] pair. Uses [seed] when provided so tests are
  /// deterministic; otherwise picks a new line on every call.
  static ({String title, String body}) pick({int? seed}) {
    final idx = seed == null
        ? Random().nextInt(_all.length)
        : seed.abs() % _all.length;
    final q = _all[idx];
    return (title: q.title, body: q.body);
  }
}

class _IntentionQuote {
  const _IntentionQuote({required this.title, required this.body});
  final String title;
  final String body;
}
