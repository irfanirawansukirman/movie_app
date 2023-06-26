// source: https://stackoverflow.com/a/68242799

T tryCast<T, R>(dynamic value, dynamic replacementValue) {
  try {
    return (value as T);
  } on TypeError catch (_) {
    return (replacementValue as T);
  }
}
