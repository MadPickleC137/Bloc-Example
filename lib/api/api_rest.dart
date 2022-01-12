import 'package:bloc_example/api/api_response.dart';
import 'package:bloc_example/api/routes.dart';
import 'package:bloc_example/models/image_hero.dart';
import 'package:bloc_example/models/powerstats.dart';
import 'package:bloc_example/models/work_hero.dart';
import 'package:http/http.dart' as http;

class RestApi {
  static Future<ResponseApi<Powerstats>> getPowerstats(
      String characterId) async {
    var path = Uri.parse(powerstatsHeroPath(characterId));
    var response = await http.get(path);
    Status status = Status.Empty;
    Powerstats? data;
    if (response.statusCode == 200) {
      status = Status.Success;
      data = Powerstats.fromJson(response.body);
    } else {
      status = Status.Error;
    }
    // if (response.statusCode == 403) {
    //   status = Status.Forbidden;
    // }
    return ResponseApi<Powerstats>(status: status, data: data);
  }

  static Future<ResponseApi<WorkHero>> getHeroWork(String characterId) async {
    var path = Uri.parse(workHeroPath(characterId));
    var response = await http.get(path);
    Status status = Status.Empty;
    WorkHero? data;
    if (response.statusCode == 200) {
      status = Status.Success;
      data = WorkHero.fromJson(response.body);
    } else {
      status = Status.Error;
    }
    // if (response.statusCode == 403) {
    //   status = Status.Forbidden;
    // }
    return ResponseApi<WorkHero>(status: status, data: data);
  }

  static Future<ResponseApi<ImageHero>> getHeroImage(String characterId) async {
    var path = Uri.parse(imageHeroPath(characterId));
    var response = await http.get(path);
    Status status = Status.Empty;
    ImageHero? data;
    if (response.statusCode == 200) {
      status = Status.Success;
      data = ImageHero.fromJson(response.body);
    } else {
      status = Status.Error;
    }
    // if (response.statusCode == 403) {
    //   status = Status.Forbidden;
    // }
    return ResponseApi<ImageHero>(status: status, data: data);
  }
}
