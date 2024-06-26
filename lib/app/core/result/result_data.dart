import 'package:dogs_app/app/core/result/result.dart';

abstract class DataResult<T> extends Result {
  final T? data;

  DataResult(bool success, String message, this.data) : super(success,message);
}
