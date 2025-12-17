import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HighlightedTextWidget extends StatelessWidget {
  final String text;
  final List<String> hashtags;

  const HighlightedTextWidget({
    super.key,
    required this.text,
    required this.hashtags,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        children: _buildTextSpans(),
      ),
    );
  }

  List<TextSpan> _buildTextSpans() {
    if (hashtags.isEmpty) {
      return [TextSpan(text: text)];
    }

    final spans = <TextSpan>[];
    String remainingText = text;
    int currentIndex = 0;

    while (currentIndex < remainingText.length) {
      bool foundHashtag = false;

      for (final hashtag in hashtags) {
        if (remainingText.substring(currentIndex).startsWith(hashtag)) {
          // Add any text before the hashtag
          if (currentIndex > 0) {
            spans.add(TextSpan(
              text: remainingText.substring(0, currentIndex),
            ));
            remainingText = remainingText.substring(currentIndex);
            currentIndex = 0;
          }

          // Add the highlighted hashtag
          spans.add(TextSpan(
            text: hashtag,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ));

          remainingText = remainingText.substring(hashtag.length);
          foundHashtag = true;
          break;
        }
      }

      if (!foundHashtag) {
        currentIndex++;
      }
    }

    // Add any remaining text
    if (remainingText.isNotEmpty) {
      spans.add(TextSpan(text: remainingText));
    }

    return spans.isEmpty ? [TextSpan(text: text)] : spans;
  }
}