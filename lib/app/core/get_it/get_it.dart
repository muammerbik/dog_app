import 'package:dogs_app/app/data/data_sources/remote_data_source.dart';
import 'package:dogs_app/app/data/repositories/dog_repository.dart';
import 'package:dogs_app/app/domain/data_source/remote_data_source.dart';
import 'package:dogs_app/app/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  setUpdataSource();
  setUprepository();
}

void setUpdataSource() {
  getIt.registerLazySingleton<FetchDogBreeds>(() =>RemoteDogBreedsFetchI() );
}

void setUprepository() {
  getIt.registerLazySingleton<Repository>(() =>DogRepository() );
}
