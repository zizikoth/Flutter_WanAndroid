extension StringExt on String? {
  String get orEmpty {
    return this ?? "";
  }

  bool get isNullOrEmpty {
    return this.orEmpty.isEmpty;
  }

  bool get isNotNullOrEmpty {
    return !this.isNullOrEmpty;
  }

  bool get isHttpUrl {
    return this.isNotNullOrEmpty && this!.toLowerCase().startsWith("http");
  }
}
