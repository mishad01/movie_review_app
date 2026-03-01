import 'package:flutter/material.dart';
import 'package:movie_review_app/data/service/api_service.dart';
import 'package:movie_review_app/domain/entities/movie.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Movie> _trendingMovies = [];
  List<Movie> get trendingMovies => _trendingMovies;

  List<Movie> _searchResult = [];
  List<Movie> get searchResult => _searchResult;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchTrendingMovies() async {
    _setLoading(true);

    try {
      _trendingMovies = await _apiService.getTrendingMovies();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoading(false);
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      _searchResult = [];
      notifyListeners();
      return;
    }

    _setLoading(true);
    try {
      _searchResult = await _apiService.searchMovies(query);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }

    _setLoading(false);
  }

  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    _setLoading(true);

    try {
      return await _apiService.getMovieDetails(movieId);
    } catch (e) {
      throw Exception();
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
