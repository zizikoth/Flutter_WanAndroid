extension ListExt<T> on List<T>? {
  List<T> get orEmpty {
    return this ?? [];
  }

  bool get isNullOrEmpty {
    return this.orEmpty.isEmpty;
  }

  bool get isNotNullOrEmpty {
    return !this.isNullOrEmpty;
  }
}
