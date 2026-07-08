import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart' show PackageInfo;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/app_actions.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';

/// Help & Support screen — FAQ + a contact form that opens the system
/// mail app via [AppActions.openSupportEmail]. Reached from Settings →
/// Ecosystem Support → Help & Support.
class HelpSupportScreen extends ConsumerStatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  ConsumerState<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends ConsumerState<HelpSupportScreen> {
  final _messageController = TextEditingController();
  late String _topic;
  bool _sending = false;
  String? _appVersion;
  String? _deviceLine;

  late final List<String> _topics;

  @override
  void initState() {
    super.initState();
    final l10n = AppLocalizations.of(context);
    _topics = <String>[
      l10n.helpTopicsGeneral,
      l10n.helpTopicsBug,
      l10n.helpTopicsStreak,
      l10n.helpTopicsBilling,
      l10n.helpTopicsAccount,
      l10n.helpTopicsFeature,
    ];
    _topic = _topics.first;
    _loadDiagnostics();
  }

  Future<void> _loadDiagnostics() async {
    String version = 'unknown';
    try {
      final info = await PackageInfo.fromPlatform();
      version = '${info.version}+${info.buildNumber}';
    } catch (_) {
      // package_info_plus not available — fall back silently.
    }
    final device = '${Platform.operatingSystem} '
        '${Platform.operatingSystemVersion} · ${Platform.localeName}';
    if (mounted) {
      setState(() {
        _appVersion = version;
        _deviceLine = device;
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final l10n = AppLocalizations.of(context);
    final text = _messageController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.helpAddMessage)),
      );
      return;
    }
    setState(() => _sending = true);
    final email = Supabase.instance.client.auth.currentUser?.email ?? '';
    final body = StringBuffer()
      ..writeln(text)
      ..writeln()
      ..writeln('---')
      ..writeln(
          'Account: ${email.isEmpty ? l10n.helpAccountAnon : email}')
      ..writeln('App: Bloom Tracker $_appVersion')
      ..writeln('Device: $_deviceLine')
      ..writeln('Topic: $_topic');
    final ok = await AppActions.openSupportEmail(
      subject: 'Bloom Tracker · $_topic',
      body: body.toString(),
    );
    if (!mounted) return;
    setState(() => _sending = false);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.helpNoMailApp)),
      );
    } else {
      _messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.helpOpening)),
      );
    }
  }

  void _copyEmail() {
    final l10n = AppLocalizations.of(context);
    Clipboard.setData(
      const ClipboardData(text: 'support@bloomtracker.app'),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.helpCopiedEmail)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AmbientBackground(
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _Header(onBack: () => context.pop()),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    Text(
                      l10n.helpTitle,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.helpBody,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(l10n.helpSectionFAQ),
                    _FaqList(l10n: l10n),
                    const SizedBox(height: 26),
                    _SectionLabel(l10n.helpSectionContact),
                    _ContactCard(
                      topic: _topic,
                      onTopicChanged: (v) => setState(() => _topic = v),
                      topics: _topics,
                      messageController: _messageController,
                      sending: _sending,
                      onSend: _send,
                      onCopyEmail: _copyEmail,
                    ),
                    const SizedBox(height: 18),
                    Center(
                      child: Text(
                        'Bloom Tracker · ${_appVersion ?? '…'}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_rounded),
            color: AppColors.onSurface,
            tooltip: AppLocalizations.of(context).commonBack,
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: BlueprintLabel(text, color: AppColors.onSurfaceVariant),
    );
  }
}

class _FaqList extends StatelessWidget {
  const _FaqList({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final entries = <_FaqEntry>[
      _FaqEntry(question: l10n.helpFaqQ1, answer: l10n.helpFaqA1),
      _FaqEntry(question: l10n.helpFaqQ2, answer: l10n.helpFaqA2),
      _FaqEntry(question: l10n.helpFaqQ3, answer: l10n.helpFaqA3),
      _FaqEntry(question: l10n.helpFaqQ4, answer: l10n.helpFaqA4),
      _FaqEntry(question: l10n.helpFaqQ5, answer: l10n.helpFaqA5),
      _FaqEntry(question: l10n.helpFaqQ6, answer: l10n.helpFaqA6),
      _FaqEntry(question: l10n.helpFaqQ7, answer: l10n.helpFaqA7),
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outlineVariant, width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < entries.length; i++) ...[
            _FaqTile(entry: entries[i]),
            if (i != entries.length - 1)
              const Divider(
                height: 1,
                thickness: 0.5,
                color: AppColors.outlineVariant,
                indent: 18,
                endIndent: 18,
              ),
          ],
        ],
      ),
    );
  }
}

class _FaqEntry {
  const _FaqEntry({required this.question, required this.answer});
  final String question;
  final String answer;
}

class _FaqTile extends StatefulWidget {
  const _FaqTile({required this.entry});
  final _FaqEntry entry;

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _open = !_open),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.entry.question,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _open ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.expand_more_rounded,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                if (_open) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.entry.answer,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.topic,
    required this.onTopicChanged,
    required this.topics,
    required this.messageController,
    required this.sending,
    required this.onSend,
    required this.onCopyEmail,
  });

  final String topic;
  final ValueChanged<String> onTopicChanged;
  final List<String> topics;
  final TextEditingController messageController;
  final bool sending;
  final VoidCallback onSend;
  final VoidCallback onCopyEmail;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return GlassCard(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.support_agent_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.commonSend,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            l10n.helpTopicLabel,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 6),
          _TopicChips(
            topics: topics,
            selected: topic,
            onChanged: onTopicChanged,
          ),
          const SizedBox(height: 14),
          Text(
            l10n.helpWhatHappened,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: messageController,
            minLines: 4,
            maxLines: 8,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              hintText: l10n.helpHint,
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.outlineVariant,
                  width: 0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.outlineVariant,
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: sending ? null : onSend,
                  icon: sending
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.mail_rounded, size: 18),
                  label: Text(sending ? l10n.helpOpeningAction : l10n.helpEmailUs),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: onCopyEmail,
                icon: const Icon(Icons.copy_rounded),
                color: AppColors.onSurfaceVariant,
                tooltip: l10n.helpCopyEmail,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            l10n.helpDisclaimer,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicChips extends StatelessWidget {
  const _TopicChips({
    required this.topics,
    required this.selected,
    required this.onChanged,
  });

  final List<String> topics;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final t in topics)
          ChoiceChip(
            label: Text(t),
            selected: t == selected,
            onSelected: (_) => onChanged(t),
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.surface,
            side: const BorderSide(
              color: AppColors.outlineVariant,
              width: 0.5,
            ),
            labelStyle: TextStyle(
              color: t == selected ? Colors.white : AppColors.onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          ),
      ],
    );
  }
}
