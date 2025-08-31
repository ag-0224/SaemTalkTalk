abstract class ApiResponse<T> {
  final String? httpStatus;
  final int? stateCode;
  final int? status;
  final String? timestamp;
  final String? message;
  final String? error;
  final T? result;

  ApiResponse({
    this.httpStatus,
    this.stateCode,
    this.status,
    this.error,
    this.timestamp,
    this.message,
    this.result,
  });
}