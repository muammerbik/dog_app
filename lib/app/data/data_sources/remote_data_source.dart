import 'dart:convert';
import 'dart:io';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DogRemoteDataSourceImpl {

  final String fetchAllBreeds = "https://dog.ceo/api/breeds/list/all";

  Future<List<DogBreedModel>> fetchBreeds() async {
    Directory directory = await getApplicationDocumentsDirectory();
    directory.listSync().forEach((FileSystemEntity entity) {
      if (entity is File) {
        entity.deleteSync();
      }
    });
    
    var response = await http.get(Uri.parse(fetchAllBreeds));
    var responseJson = jsonDecode(response.body);
    var responseResult = responseJson["message"] as Map<String, dynamic>;

    List<DogBreedModel> breedList = [];
    for (var breed in responseResult.keys) {
      File file = File("");
      List<String> subBreeds = List<String>.from(responseResult[breed]);
      String imageUrl = '';

      var imageResponse = await http.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      );

      if (imageResponse.statusCode == 200) {
        var imageUrlData = jsonDecode(imageResponse.body);

        imageUrl = imageUrlData["message"];
        Future<File> getLocalImageFile() async {
          String filePath = '${directory.path}/cached_image_$breed.jpg';
          file = File(filePath);

          if (await file.exists()) {
            return file;
          } else {
            final response = await http.get(Uri.parse(imageUrl));
            if (response.statusCode == 200) {
              await file.writeAsBytes(response.bodyBytes);
              return file;
            } else {
              throw Exception('Resim indirilemedi');
            }
          }
        }

        file = await getLocalImageFile();
      }

      if (imageUrl.isNotEmpty) {
        breedList.add(
          DogBreedModel(name: breed, imagePath: file, subBreeds: subBreeds),
        );
      }
    }
    return breedList;
  }

  Future<String> fetchBreedByName({required String name}) async {
    http.Response response = await http
        .get(Uri.parse("https://dog.ceo/api/breed/$name/images/random"));
    var responseJson = jsonDecode(response.body);
    return responseJson["message"];
  }
}
