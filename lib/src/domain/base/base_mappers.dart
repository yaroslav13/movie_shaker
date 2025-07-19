abstract interface class BaseMapper<From, To> {
  To map(From argument);
}

abstract interface class BaseBiMapper<From, To> extends BaseMapper<From, To> {
  From reverseMap(To argument);
}
