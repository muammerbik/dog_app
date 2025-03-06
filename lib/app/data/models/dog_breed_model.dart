import 'dart:io';
import 'package:equatable/equatable.dart';

final class DogBreedModel extends Equatable {
  final String? name;
  final File? imagePath;
  final List? subBreeds;
  const DogBreedModel({
    this.name,
    this.imagePath,
    this.subBreeds,
  });

  @override
  List<Object?> get props => [name, imagePath, subBreeds];

  DogBreedModel copyWith({
    String? name,
    File? imagePath,
    List? subBreeds,
  }) {
    return DogBreedModel(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      subBreeds: subBreeds ?? this.subBreeds,
    );
  }

  @override
  bool get stringify => true;
}