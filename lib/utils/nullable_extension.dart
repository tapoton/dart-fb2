extension NullableExtension<T> on T? {
  U? map<U>(U Function(T) transform) {
    final obj = this;
    if (obj == null) return null;
    return transform(obj);
  }

  U? flatMap<U>(U? Function(T) transform) {
    final obj = this;
    if (obj == null) return null;
    return transform(obj);
  }
}

extension CompactList<T> on Iterable<T?> {
  List<T> compact() {
    return this.compactMap((e) => e);
  }
}

extension CompactMap<T> on Iterable<T> {
  List<U> compactMap<U>(U? Function(T) transform) {
    return this.fold([], (list, element) {
      final transformed = transform(element);
      if (transformed != null) {
        list.add(transformed);
      }
      return list;
    });
  }
}
