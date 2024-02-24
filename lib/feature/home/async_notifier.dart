// import 'package:riverpod/riverpod.dart';

// AsyncNotifierProvider<List<Candidate>> geminiControllerProvider =
//     AsyncNotifierProvider((ref) => GeminiControllerNotifier());



// class AsyncTodosNotifier extends StateNotifier<AsyncValue<>> {
//   AsyncTodosNotifier() : super(const AsyncLoading()) {
//     _postInit();
//   }

//   Future<void> _postInit() async {
//     state = AsyncLoading();  
//     state = await AsyncValue.guard(() async {
//       final json = await http.get('api/todos');

//       return [...json.map(Todo.fromJson)];
//     });
//   }

// // ...
// }


// // class GeminiControllerNotifier
// //     extends AsyncNotifier<List<Candidate>> {
// //
// //   FutureOr<List<Candidate>> build() async {
// //     return [];
// //   }
// //
// //   Future<void> sendMessageToGemini(String questionValue) async {
// //     try {
// //       state = AsyncValue.loading();
// //       final modelValue =
// //       await ref.read(geminiRepositoryProvider).sendMessageToGemini(questionValue);
// //       if (modelValue != null &&
// //           modelValue.candidates != null &&
// //           modelValue.candidates!.isNotEmpty) {
// //         final candidateList = modelValue.candidates!;
// //         state = AsyncData(
// //             [...(state.value ?? []), ...candidateList]);
// //         debugPrint('ListLength is :: ${state.value?.length}');
// //       }
// //     } on Exception catch (e) {
// //       state = AsyncError(e, StackTrace.current);
// //     }
// //   }
// // }