import 'package:mvvm_movie_app/data/source/remote/movie_remote_source.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
