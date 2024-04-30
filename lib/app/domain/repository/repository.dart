import 'package:dogs_app/app/core/result/result_data.dart';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';

abstract class Repository {
  Future<DataResult<List<DogBreedModel>>> getAllBreeds();
  Future<DataResult<String>> getBreedsImage({required String name});
}
