// Assuming you're using Provider package for state management
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http/feature/home/async_notifier.dart';

class AsyncHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build called");
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Consumer(
              builder: (context, watch, child) {
                final asyncValue = ref.watch(asyncStateProvider);

                return asyncValue.when(
                  loading: () => CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
                  data: (postResponse) =>
                      Text('Data: ${postResponse.userList}'),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
//  added changes here
              },
              child: Text("Change index"))
        ],
      ),
    );
  }
}
