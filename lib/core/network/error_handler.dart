class ErrorHandler{
  final dynamic error;
  ErrorHandler({required this.error});
  static getMessage(dynamic error){
    String message='An error occurred. Please try again later.';
    if(error is Exception){
      message=error.toString();
      
    }
    else if(error is String){
      message=error;
    }
    return message;
  }
}