import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreInputDialog extends ConsumerStatefulWidget {
  final Function(int runs, String extras, bool isWicket) onSubmit;

  const ScoreInputDialog({
    required this.onSubmit,
    super.key,
  });

  @override
  ConsumerState<ScoreInputDialog> createState() => _ScoreInputDialogState();
}

class _ScoreInputDialogState extends ConsumerState<ScoreInputDialog> {
  int _runs = 0;
  String _extras = 'none';
  bool _isWicket = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Record Ball'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Runs Selection
            const Text('Select Runs:'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [0, 1, 2, 3, 4, 6]
                  .map((run) => OutlinedButton(
                        onPressed: () => setState(() => _runs = run),
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              _runs == run ? Colors.blue : Colors.transparent,
                        ),
                        child: Text(
                          '$run',
                          style: TextStyle(
                            color: _runs == run ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),

            // Extras Selection
            const Text('Extras:'),
            const SizedBox(height: 12),
            DropdownButton<String>(
              value: _extras,
              isExpanded: true,
              items: [
                'none',
                'wide',
                'noBall',
                'bye',
                'legBye',
              ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _extras = value!),
            ),
            const SizedBox(height: 24),

            // Wicket Toggle
            CheckboxListTile(
              title: const Text('Is Wicket?'),
              value: _isWicket,
              onChanged: (value) => setState(() => _isWicket = value ?? false),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit(_runs, _extras, _isWicket);
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
