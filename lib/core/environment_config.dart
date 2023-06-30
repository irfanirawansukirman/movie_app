// source: https://stackoverflow.com/a/63468529

import 'package:mvvm_movie_app/core/secret.dart';

const _baseURL = "baseURL";
const _bearerToken = "bearerToken";

enum Environment { development, staging, production }

Map<String, dynamic> _config = {};

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.development:
      _config = devConstants;
      break;
    case Environment.staging:
      _config = stageConstants;
      break;
    case Environment.production:
      _config = prodConstants;
      break;
  }
}

dynamic get apiBaseURL {
  return _config[_baseURL];
}

dynamic get apiBearerToken {
  return _config[_bearerToken];
}

Map<String, dynamic> devConstants = {
  _baseURL: tmdbBaseUrl,
  _bearerToken: "Bearer $tmdbToken",
};

Map<String, dynamic> stageConstants = {
  _baseURL: tmdbBaseUrl,
  _bearerToken: "Bearer $tmdbToken",
};

Map<String, dynamic> prodConstants = {
  _baseURL: tmdbBaseUrl,
  _bearerToken: "Bearer $tmdbToken",
};
