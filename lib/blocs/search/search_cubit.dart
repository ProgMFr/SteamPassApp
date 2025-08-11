import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:steampass/domain/api/search_game.dart';

import '../../domain/data/models/steam_search_model.dart';
import 'package:rxdart/rxdart.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchGameRepository _searchGameRepository;
  SearchCubit(this._searchGameRepository)
    : super(
        SearchState(
          status: SearchStatus.initial,
          searchController: TextEditingController(),
        ),
      ) {
    init();
  }

  final _searchController = StreamController<String>();

  StreamSubscription? _searchSubscription;

  void init() {
    if (_searchSubscription != null) return;

    _searchSubscription = _searchController.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen((query) {
          if (query.trim().isEmpty) {
            resetSearch();
            return;
          }
          basicSearch(query);
        });
  }

  void debounceTimeSearch(String value) {
    _searchController.add(value);
  }

  void basicSearch(String value) async {
    emit(SearchState(status: SearchStatus.loading));
    try {
      final result = await _searchGameRepository.searchGame(value);
      emit(
        state.copyWith(
          status: SearchStatus.loadedBasicSearch,
          searchResult: result,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Search Error: $e');
      }
      emit(
        state.copyWith(status: SearchStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void resetSearch() {
    emit(SearchState(status: SearchStatus.initial));
  }

  @override
  Future<void> close() {
    _searchController.close();
    _searchSubscription?.cancel();
    return super.close();
  }
}
