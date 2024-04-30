

import 'package:dogs_app/app/core/result/result.dart';

class ErrorResult extends Result {
  ErrorResult({required String message}) : super(false, message);
}
