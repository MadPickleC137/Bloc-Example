import 'package:bloc_example/api/api_response.dart';
import 'package:bloc_example/api/api_rest.dart';
import 'package:bloc_example/models/image_hero.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageHeroCubit extends Cubit<ImageHero?> {
  ImageHeroCubit(String id) : super(null) {
    _loadImageHero(id);
  }

  void _loadImageHero(String id) async {
    var response = await RestApi.getHeroImage(id);
    if (response.status == Status.Success && response.data != null) {
      if (!isClosed) {
        emit(response.data);
        print(response.data.toString());
      }
    }
  }

  @mustCallSuper
  void dispose() async {
    close();
  }
}
