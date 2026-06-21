import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  if (!Env.isConfigured) {
    runApp(const ProviderScope(child: LeanSpaceConfigErrorApp()));
    return;
  }

  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey, // ignore: deprecated_member_use
  );

  runApp(const ProviderScope(child: LeanSpaceApp()));
}

/// Shown when `.env` is missing or still has placeholder values.
class LeanSpaceConfigErrorApp extends StatelessWidget {
  const LeanSpaceConfigErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeanSpace',
      home: Scaffold(
        appBar: AppBar(title: const Text('Setup required')),
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supabase is not configured',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Text(
                'Copy leanspace/.env.example to leanspace/.env and add your '
                'Supabase URL and anon key from the Supabase dashboard.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
