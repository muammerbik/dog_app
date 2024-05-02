import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';
import 'package:dogs_app/app/data/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required DogRepository dogRepository})
      : _dogRepository = dogRepository,
        super(HomeState(
            status: HomeStatus.init,
            dogBreedsList: [],
            selectedIndex: 0,
            fetchImageName: "",
            textFieldStatus: 0)) {
    on<FetchDogBreedsEvent>(onFetchDogBreedsEvent);
    on<SetSelectedIndexEvent>(onSetSelectedIndexEvent);
    on<FetchRandomImageEvent>(onFetchRandomImageEvent);
    on<ChangeTextFieldStatus>(onChangeTextFieldStatus);
  }

  final DogRepository _dogRepository;

  Future<FutureOr<void>> onFetchDogBreedsEvent(
      FetchDogBreedsEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    var response = await _dogRepository.getAllBreeds();
    if (response.success) {
      emit(state.copyWith(
          status: HomeStatus.succes, dogBreedsList: response.data));
    } else {
      emit(state.copyWith(
        status: HomeStatus.error,
      ));
    }
  }

  FutureOr<void> onSetSelectedIndexEvent(
      SetSelectedIndexEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  Future<FutureOr<void>> onFetchRandomImageEvent(
      FetchRandomImageEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    var response =
        await _dogRepository.getBreedsImage(name: event.fetchRandomImage);
    if (response.success) {
      emit(state.copyWith(
          status: HomeStatus.succes, fetchImageName: response.data));
    }else {
       emit(state.copyWith(status: HomeStatus.error));
    }
  }

  FutureOr<void> onChangeTextFieldStatus(
      ChangeTextFieldStatus event, Emitter<HomeState> emit) {
    emit(state.copyWith(textFieldStatus: event.textFieldSatus));
  }
}
