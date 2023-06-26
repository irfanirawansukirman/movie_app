// source: https://stackoverflow.com/a/63468529

import 'package:mvvm_movie_app/core/secret.dart';

const _baseUrl = "baseUrl";
const _bearerToken = "bearerToken";

enum Environment { dev, stage, prod }

Map<String, dynamic> _config = {};

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.dev:
      _config = devConstants;
      break;
    case Environment.stage:
      _config = stageConstants;
      break;
    case Environment.prod:
      _config = prodConstants;
      break;
  }
}

dynamic get apiBaseUrl {
  return _config[_baseUrl];
}

dynamic get apiBearerToken {
  return _config[_bearerToken];
}

Map<String, dynamic> devConstants = {
  _baseUrl: "https://api.themoviedb.org/3/",
  _bearerToken: "Bearer $tmdbToken",
};

Map<String, dynamic> stageConstants = {
  _baseUrl: "https://api.themoviedb.org/3/",
  _bearerToken: "Bearer $tmdbToken",
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "https://api.themoviedb.org/3/",
  _bearerToken: "Bearer $tmdbToken",
};
