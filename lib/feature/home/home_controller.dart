import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/user.dart';
import '../../product/services/api_service.dart';

final homeProvider = StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(ref.watch(apiServiceProvider));
});

class HomeController extends StateNotifier<HomeState> {
  final ApiService _apiService;

  HomeController(this._apiService) : super(HomeState());

  void fetchUser() async {
    try {
      print("data cekilmeye baslandi");

      state = state.copyWith(error: null, postResponse: null);
      final PostResponse allUsers = await _apiService.getRequest();

      state = state.copyWith(error: null, postResponse: allUsers);
    } catch (error) {
      state = state.copyWith(error: "$error", postResponse: null);
    }
  }
}

class HomeState extends Equatable {
  final String? error;
  final PostResponse? postResponse;

  HomeState({this.error, this.postResponse});

  copyWith({String? error, PostResponse? postResponse}) {
    return HomeState(
        error: error ?? this.error,
        postResponse: postResponse ?? this.postResponse);
  }

  @override
  List<Object?> get props => [error, postResponse];
}
