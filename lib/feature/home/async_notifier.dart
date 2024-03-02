import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_http/product/model/user.dart';
import 'package:riverpod_http/product/services/api_service.dart';

final asyncStateProvider =
    StateNotifierProvider<AsyncTodosNotifier, AsyncValue<PostResponse>>((ref) {
  return AsyncTodosNotifier(
    apiService: ref.watch(apiServiceProvider),
  );
});

class AsyncTodosNotifier extends StateNotifier<AsyncValue<PostResponse>> {
  final ApiService apiService;

  AsyncTodosNotifier({required this.apiService}) : super(const AsyncLoading()) {
    _postInit();
  }

  Future<void> _postInit() async {
    state = AsyncLoading();
// api service'in metotunu kullanabilirim artik
    final Future<PostResponse> response = apiService.getRequest();
    state = AsyncData(await response);
  }
}

// class GeminiControllerNotifier
//     extends AsyncNotifier<List<Candidate>> {
//
//   FutureOr<List<Candidate>> build() async {
//     return [];
//   }
//
//   Future<void> sendMessageToGemini(String questionValue) async {
//     try {
//       state = AsyncValue.loading();
//       final modelValue =
//       await ref.read(geminiRepositoryProvider).sendMessageToGemini(questionValue);
//       if (modelValue != null &&
//           modelValue.candidates != null &&
//           modelValue.candidates!.isNotEmpty) {
//         final candidateList = modelValue.candidates!;
//         state = AsyncData(
//             [...(state.value ?? []), ...candidateList]);
//         debugPrint('ListLength is :: ${state.value?.length}');
//       }
//     } on Exception catch (e) {
//       state = AsyncError(e, StackTrace.current);
//     }
//   }
// }
