import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/core/result/error_data_result.dart';
import 'package:dogs_app/app/core/result/result_data.dart';
import 'package:dogs_app/app/core/result/succes_data_result.dart';
import 'package:dogs_app/app/data/data_sources/remote_data_source.dart';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';
import 'package:dogs_app/app/domain/repository/repository.dart';

class DogRepository implements Repository {
  final DogRemoteDataSourceImpl _remoteDogBreedsFetchI =
      DogRemoteDataSourceImpl();

  @override
  Future<DataResult<List<DogBreedModel>>> getAllBreeds() async {
    try {
      var response = await _remoteDogBreedsFetchI.fetchBreeds();

      return SuccessDataResult(data: response);
    } catch (e) {
      return ErrorDataResult(message: "veri gelirken hata oluştuu");
    }
  }

  @override
  Future<DataResult<String>> getBreedsImage({required String name}) async {
    try {
      var response = await _remoteDogBreedsFetchI.fetchBreedByName(name: name);

      return SuccessDataResult(data: response);
    } catch (e) {
      return ErrorDataResult(message: "veriler repodan gelirken hata olustu");
    }
  }
}
