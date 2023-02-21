class NoInternetException implements Exception {}

class ServerException implements Exception {
  const ServerException({
    required this.message,
  });
  final String message;
}
