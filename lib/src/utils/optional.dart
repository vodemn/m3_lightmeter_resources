class Optional<T> {
  final T? value;

  const Optional(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Optional && other.value == value;
  }

  @override
  int get hashCode => Object.hash(value, runtimeType);
}
