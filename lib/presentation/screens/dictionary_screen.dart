import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/dictionary_item_controller.dart';
import 'package:quiz_app/presentation/widgets/link_button.dart';

class DictionaryScreen extends HookConsumerWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionaryItemState = ref.watch(dictionaryItemControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "単語集",
        ),
      ),
      body: dictionaryItemState.when(
        data: (dictionaryItemList) => dictionaryItemList.isEmpty
            ? const Center(
                child: Text("辞書に単語が追加されていません"),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dictionaryItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  final dictionaryItem = dictionaryItemList[index];
                  return ListTile(
                    title: Text(dictionaryItem.dictionaryWord),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {
                      LinkButton().launchUriWithString(
                        context,
                        dictionaryItem.dictionaryUrl,
                      );
                    }
                  );
                },
              ),
        error: (error, _) => Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "エラーが発生しています",
                textAlign: TextAlign.center,
              ),
              Lottie.asset("assets/json_files/error.json",
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.fitWidth),
            ],
          ),
        ),
        loading: () => Center(
          child: Lottie.asset("assets/json_files/loading.json",
              width: 200, height: 200),
        ),
      ),
    );
  }
}
