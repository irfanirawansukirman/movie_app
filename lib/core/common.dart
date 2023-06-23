// source: https://stackoverflow.com/a/68242799

T? tryCast<T>(dynamic value) {
  try {
    return (value as T);
  } on TypeError catch (_) {
    return null;
  }
}