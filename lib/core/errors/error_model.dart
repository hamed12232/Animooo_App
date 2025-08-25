class ErrorModel {
  final List<String> error;
  final int code;

  ErrorModel({required this.error,required this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      error: List<String>.from(json['error'] ?? []),
      code: json['statusCode'],
    );
  }
  @override
  String toString() {
    if (error.isNotEmpty) {
      return error.join(', ');
    }
    
    return super.toString();
  }
  
}

