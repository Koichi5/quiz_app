import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/dictionary_item/dictionary_item.dart';
import 'package:quiz_app/presentation/widgets/link_button.dart';

class DictionaryCard extends HookConsumerWidget {
  const DictionaryCard({required this.dictionaryItem, Key? key})
      : super(key: key);

  final DictionaryItem dictionaryItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dictionaryItem.dictionaryWord),
          ),
          collapsed: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("解説"),
          ),
          expanded: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.clip,
                          dictionaryItem.dictionaryDescription,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  LinkButton().launchUriWithString(
                      context, dictionaryItem.dictionaryUrl);
                },
                child: const Text(
                  "リンク",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
