import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../bloc/phrase_bloc.dart';
import '../bloc/phrase_event.dart';
import '../bloc/phrase_state.dart';
import '../widget/highlighted_text_field.dart';

class ScreenC extends StatefulWidget {
  const ScreenC({super.key});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _hashtagsController = TextEditingController();

  @override
  void dispose() {
    _phraseController.dispose();
    _hashtagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<PhraseBloc, PhraseState>(
        listener: (context, state) {
          if (state.isSubmitted) {
            context.pushReplacement(
              AppRouter.screenB,
              extra: {
                'phrase': state.phrase,
                'hashtags': state.allHashtags,
              },
            );
          }
        },
        builder: (context, state) {
          // Update hashtags field with auto-extracted hashtags
          if (state.autoHashtags.isNotEmpty || state.manualHashtags.isNotEmpty) {
            final currentCursorPosition = _hashtagsController.selection.baseOffset;
            _hashtagsController.text = state.allHashtags.join(' ');

            // Restore cursor position if valid
            if (currentCursorPosition >= 0 &&
                currentCursorPosition <= _hashtagsController.text.length) {
              _hashtagsController.selection = TextSelection.fromPosition(
                TextPosition(offset: currentCursorPosition),
              );
            }
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Phrase',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                HighlightedTextField(
                  controller: _phraseController,
                  hashtags: state.autoHashtags,
                  onChanged: (value) {
                    context.read<PhraseBloc>().add(PhraseTextChanged(value));
                  },
                  hintText: 'Enter your phrase with #hashtags',
                  maxLines: 5,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Hashtags',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                HighlightedTextField(
                  controller: _hashtagsController,
                  hashtags: state.allHashtags,
                  onChanged: (value) {
                    context.read<PhraseBloc>().add(HashtagsTextChanged(value));
                  },
                  hintText: 'Auto-populated and manual hashtags',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    context.read<PhraseBloc>().add(const SubmitPhrase());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}