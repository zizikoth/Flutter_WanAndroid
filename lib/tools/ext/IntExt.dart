extension IntExt on int? {
  int get orEmpty {
    return this ?? 0;
  }

  bool get isNullOrZero {
    return this.orEmpty == 0;
  }

  bool get isNotNullOrZero {
    return !this.isNullOrZero;
  }
}
