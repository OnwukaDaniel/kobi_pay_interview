sealed class NetworkState<T> {
  const NetworkState();


}

class NetworkSuccess<T> extends NetworkState<T> {
  final T data;

  const NetworkSuccess(this.data);
}

class NetworkLoading<T> extends NetworkState<T> {
  final String message;

  const NetworkLoading({this.message = 'Loading...'});
}

class NetworkFailure<T> extends NetworkState<T> {
  final String message;

  const NetworkFailure(this.message);
}
