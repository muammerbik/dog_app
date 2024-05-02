import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/core/result/error_data_result.dart';
import 'package:dogs_app/app/core/result/result_data.dart';
import 'package:dogs_app/app/core/result/succes_data_result.dart';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';
import 'package:dogs_app/app/domain/data_source/remote_data_source.dart';
import 'package:dogs_app/app/domain/repository/repository.dart';

class DogRepository extends Repository {
  final FetchDogBreeds _fetchDogBreeds;
  DogRepository({required FetchDogBreeds fetchDogBreeds})
      : _fetchDogBreeds = fetchDogBreeds;

  @override
  Future<DataResult<List<DogBreedModel>>> getAllBreeds() async {
    var response = await _fetchDogBreeds.getAllBreeds();
    if (response != null) {
      return SuccessDataResult(data: response);
    } else {
      return ErrorDataResult(message: "veri gelirken hata oluştuu");
    }
  }

  @override
  Future<DataResult<String>> getBreedsImage({required String name}) async {
    var response = await _fetchDogBreeds.getBreedsImage(name: name);
    if (response != null) {
      return SuccessDataResult(data: response);
    } else {
      return ErrorDataResult(message: "veriler repodan gelirken hata olustu");
    }
  }
}
