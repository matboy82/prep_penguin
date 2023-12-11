import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class RichTextEditor extends StatelessWidget {
  RichTextEditor({super.key});

  final QuillController _controller = QuillController.basic();
 
  @override
  Widget build(BuildContext context) {
    return QuillProvider(
      configurations: QuillConfigurations(
        controller: _controller,
        sharedConfigurations: const QuillSharedConfigurations(
          locale: Locale('en', 'US'),
        ),
      ),
      child: ListView(
      shrinkWrap: true,
      children: [
        const QuillToolbar(),
        
        QuillEditor.basic(
            configurations: const QuillEditorConfigurations(
              readOnly: false,
              minHeight: 200,
              maxHeight: 500,
              showCursor: true,
              )
            ),
      ],
    ),
    );
  }

String getJsonDocument() {
  var delta = _controller.document.toDelta().toJson();
  debugPrint(jsonEncode(delta));
  return jsonEncode(delta);
}

  void dispose() {
    _controller.dispose();
  }
}

