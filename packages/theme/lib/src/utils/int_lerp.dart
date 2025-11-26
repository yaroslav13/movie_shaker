int? lerpInt(int? a, int? b, double t) {
  if (a == null && b == null) {
    return null;
  }

  if (b == null) {
    return a;
  }
  if (a == null) {
    return b;
  }

  return (a + (b - a) * t).round();
}
