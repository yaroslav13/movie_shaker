abstract interface class Interactor<R, P> {
  Future<R> call(P param);
}

abstract interface class NoArgumentInteractor<R> {
  Future<R> call();
}

abstract interface class StreamInteractor<R, P> {
  Stream<R> call(P param);
}

abstract interface class NoArgumentStreamInteractor<R> {
  Stream<R> call();
}
