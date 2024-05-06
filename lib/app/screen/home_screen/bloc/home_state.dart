part of 'home_bloc.dart';

enum HomeStatus { init, loading, succes, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<DogBreedModel> dogBreedsList;
  final int selectedIndex;
  final String fetchImageName;
  final int textFieldStatus;
  final String searchName;
  final List<DogBreedModel> searchList;
  TextEditingController searchController = TextEditingController();

   HomeState({
    required this.status,
    required this.dogBreedsList,
    required this.selectedIndex,
    required this.fetchImageName,
    required this.textFieldStatus,
    required this.searchName,
    required this.searchList,
    required this.searchController,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? dogBreedsList,
    int? selectedIndex,
    String? fetchImageName,
    int? textFieldStatus,
    String? searchName,
    List<DogBreedModel>? searchList,
    TextEditingController? searchController,
  }) {
    return HomeState(
      status: status ?? this.status,
      dogBreedsList: dogBreedsList ?? this.dogBreedsList,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      fetchImageName: fetchImageName ?? this.fetchImageName,
      textFieldStatus: textFieldStatus ?? this.textFieldStatus,
      searchName: searchName ?? this.searchName,
      searchList: searchList ?? this.searchList,
      searchController : searchController ?? this.searchController,
    );
  }

  @override
  List<Object> get props => [
        status,
        dogBreedsList,
        selectedIndex,
        fetchImageName,
        textFieldStatus,
        searchName,
        searchList,
        searchController
      ];
}
