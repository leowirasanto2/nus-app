extension NumberExtension on int? {
  int get orZero => this ?? 0;
}