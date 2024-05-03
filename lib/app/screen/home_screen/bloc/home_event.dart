part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class FetchDogBreedsEvent extends HomeEvent {
  const FetchDogBreedsEvent();

  @override
  List<Object> get props => [];
}

class SetSelectedIndexEvent extends HomeEvent {
  final int selectedIndex;
 const SetSelectedIndexEvent({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}

class FetchRandomImageEvent extends HomeEvent {
  final String fetchRandomImage;
  const FetchRandomImageEvent({required this.fetchRandomImage});

  @override
  List<Object> get props => [fetchRandomImage];
}

class ChangeTextFieldStatus extends HomeEvent {
  const ChangeTextFieldStatus({required this.textFieldSatus});
  final int textFieldSatus;

  @override
  List<Object> get props => [textFieldSatus];
}
