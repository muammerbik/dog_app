import 'package:dogs_app/app/core/result/result_data.dart';

class SuccessDataResult<T> extends DataResult<T> {
  SuccessDataResult({String? message, required T data}) : super(true, message ?? "Success", data);
}
