part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  loadedBasicSearch,
  loadedFullSearch,
  error,
}

extension SearchStatusX on SearchStatus {
  bool get isInitial => this == SearchStatus.initial;
  bool get isLoading => this == SearchStatus.loading;
  bool get isLoadedBasicSearch => this == SearchStatus.loadedBasicSearch;
  bool get isLoadedFullSearch => this == SearchStatus.loadedFullSearch;
  bool get isError => this == SearchStatus.error;
}

@immutable
class SearchState {
  final SearchStatus status;
  final SteamSearchModel? searchResult;
  final String? errorMessage;
  final TextEditingController? searchController;

  const SearchState({
    this.status = SearchStatus.initial,
    this.searchResult,
    this.errorMessage,
    this.searchController,
  });

  SearchState copyWith({
    SearchStatus? status,
    SteamSearchModel? searchResult,
    String? errorMessage,
    TextEditingController? searchController,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchResult: searchResult ?? this.searchResult,
      errorMessage: errorMessage ?? errorMessage,
      searchController: searchController ?? this.searchController,
    );
  }

  @override
  String toString() =>
      'SearchState(status: $status, searchResult: $searchResult, errorMessage: $errorMessage , searchController: $searchController)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchState &&
        other.status == status &&
        other.searchResult == searchResult &&
        other.errorMessage == errorMessage &&
        other.searchController == searchController;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      searchResult.hashCode ^
      errorMessage.hashCode ^
      searchController.hashCode;
}
