import 'dart:convert';
import 'dart:io';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';
import 'package:dogs_app/app/domain/data_source/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class RemoteDogBreedsFetchI extends FetchDogBreeds {
  final String getAllBreedsUrl = "https://dog.ceo/api/breeds/list/all";
  final String getRandomImage = "https://dog.ceo/api/breeds/image/random";
  @override
  Future<List<DogBreedModel>> getAllBreeds() async {
    Directory directory = await getApplicationDocumentsDirectory();
    //belgelerde kayıtlı olan her bir dosyayı sildim.
    directory.listSync().forEach((FileSystemEntity entity) {
      if (entity is File) {
        entity.deleteSync();
      }
    });

    List<DogBreedModel> dogBreedsList = [];
    List<String> subDogBreedsList = [];
    File file = File("");
    String imageUrl = "";

    var response = await http.get(Uri.parse(getAllBreedsUrl));
    var responseJson = jsonDecode(response.body);
    var responseResult = responseJson["message"] as Map<String, dynamic>;

    for (var result in responseResult.keys) {
      var imageResponse = await http
          .get(Uri.parse("https://dog.ceo/api/breeds/$result/image/random"));

      if (imageResponse.statusCode == 200) {
        var imageResult = jsonDecode(
          imageResponse.body,
        );
        var imageUrl = imageResult["message"];

        Future<File> getLocalData() async {
          String imagePath = "${directory.path}/remote_image/$result.jpg";
          file = File(imagePath);

          if (await file.exists()) {
            return file;
          } else {
            var response = await http.get(Uri.parse(imageUrl));
            if (response.statusCode == 200) {
              await file.writeAsBytes(response.bodyBytes);
              return file;
            } else {
              throw Exception('Hata resim yüklenmedi');
            }
          }
        }

        file = await getLocalData();
      }

      if (imageUrl.isNotEmpty) {
        dogBreedsList.add(DogBreedModel(
            name: result, imagePath: file, subBreeds: subDogBreedsList));
      }
    }
    return dogBreedsList;
  }

  @override
  Future<String> getBreedsImage({required String name}) async {
    var response = await http
        .get(Uri.parse("https://dog.ceo/api/breed/$name/images/random"));
    var responseJson = jsonDecode(response.body);
    return responseJson["message"];
  }
}
