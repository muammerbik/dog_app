import 'package:dogs_app/app/data/models/dog_breed_model.dart';

abstract class FetchDogBreeds {
  Future<List<DogBreedModel>> getAllBreeds();
  Future<String> getBreedsImage ({required String name});
}
