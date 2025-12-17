import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../widget/highlighted_text_widget.dart';

class ScreenB extends StatelessWidget {
  final String? phrase;
  final List<String>? hashtags;

  const ScreenB({
    super.key,
    this.phrase,
    this.hashtags,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (phrase != null && hashtags != null) ...[
              const Text(
                'Submitted Data:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Phrase:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              HighlightedTextWidget(
                text: phrase!,
                hashtags: hashtags!,
              ),
              const SizedBox(height: 20),
              const Text(
                'Hashtags:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              HighlightedTextWidget(
                text: hashtags!.join(' '),
                hashtags: hashtags!,
              ),
              const SizedBox(height: 40),
            ],
            if (phrase == null || hashtags == null) ...[
              const Expanded(
                child: Center(
                  child: Text(
                    'No data submitted yet',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
            ElevatedButton(
              onPressed: () => context.push(AppRouter.screenC),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Navigate to Screen C',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
