
import 'package:dogs_app/app/core/result/result.dart';

class SuccessResult extends Result {
  SuccessResult({String? message}) : super(true, message ?? "Success");
}
