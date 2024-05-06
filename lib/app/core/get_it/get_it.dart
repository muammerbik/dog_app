import 'package:dogs_app/app/data/data_sources/remote_data_source.dart';
import 'package:dogs_app/app/data/repositories/dog_repository.dart';
import 'package:dogs_app/app/domain/repository/repository.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupGetIT() {
  setupRepositories();
  setupDatasource();
  setupBLoC();
}

void setupRepositories() {
  locator.registerLazySingleton<Repository>(
    () => DogRepository(),
  );
}

void setupDatasource() {
  locator.registerLazySingleton<DogRemoteDataSourceImpl>(
    () => DogRemoteDataSourceImpl(),
  );
}

void setupBLoC() {
  locator
    .registerLazySingleton<HomeBloc>(
      () => HomeBloc(),
    );
}
