import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/Data/models/Article Model/Article.dart';
import 'package:news/core/Source Repo/search_repo.dart';

@injectable
class Search extends Cubit<SearchState> {
  final SearchRepo repo;

  Timer? _debounce;

  Search(this.repo) : super(SearchInitial());

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    if (query.length < 2) {
      emit(SearchInitial());
      return;
    }


    _debounce = Timer(const Duration(milliseconds: 500), () {
      _search(query);
    });
  }
  void searchNow(String query) {
    if (query.length < 2) {
      emit(SearchInitial());
      return;
    }

    _debounce?.cancel();
    _search(query);
  }
  void reset() {
    emit(SearchInitial());
  }

  Future<void> _search(String query) async {
    emit(SearchLoading());

    try {
      final result = await repo.searchArticles(query);
      emit(SearchSuccess(result));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Article> articles;

  SearchSuccess(this.articles);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}