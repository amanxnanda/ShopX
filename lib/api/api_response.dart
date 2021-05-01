class ApiResponse {

  final dynamic data;
  final bool error;
  final String errorMessage;

  ApiResponse({this.data, this.error: false, this.errorMessage:''});
}
