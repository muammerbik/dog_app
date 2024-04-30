
import 'package:dogs_app/app/core/result/result_data.dart';

class ErrorDataResult<T> extends DataResult<T> {
  ErrorDataResult({required String message}) : super(false, message, null);
}
