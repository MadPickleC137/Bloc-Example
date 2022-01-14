import 'package:bloc_example/cubit/hero_powerstats_cubit.dart';
import 'package:bloc_example/cubit/hero_image_cubit.dart';
import 'package:bloc_example/cubit/hero_work_cubit.dart';
import 'package:bloc_example/models/image_hero.dart';
import 'package:bloc_example/models/powerstats.dart';
import 'package:bloc_example/models/work_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailHeroPage extends StatelessWidget {
  int heroId;

  DetailHeroPage({
    Key? key,
    required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C2A33),
        title: Text("Hero details"),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF192229),
              Color(0xFF192229),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ImageHeroWidget(
              heroId: heroId,
            ),
            PowerstatsWidget(
              heroId: heroId,
            ),
            WorkWidget(
              heroId: heroId,
            ),
          ],
        ),
      ),
    );
  }
}

class WorkWidget extends StatelessWidget {
  int heroId;

  WorkWidget({
    Key? key,
    required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkHeroCubit(heroId.toString()),
      child: BlocBuilder<WorkHeroCubit, WorkHero?>(
        builder: (context, work) {
          if (work != null) {
            return Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0x792B333A),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Text(
                work.occupation + "\n" + "Base: ${work.base}",
                style: TextStyle(
                  color: Color(0xFFCCCFD4),
                  fontSize: 12,
                ),
              ),
            );
          } else
            return Shimmer.fromColors(
              baseColor: Color(0x792B333A),
              highlightColor: Color(0xFF293946),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xFF293946)),
              ),
            );
        },
      ),
    );
  }
}

class PowerstatsWidget extends StatelessWidget {
  int heroId;
  int _countShimmers = 4;
  PowerstatsWidget({
    Key? key,
    required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PowerstatsCubit(heroId.toString()),
      child: BlocBuilder<PowerstatsCubit, Powerstats?>(
        builder: (context, powerstats) {
          if (powerstats != null) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0x792B333A),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    "Name: ${powerstats.name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFCCCFD4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    "Durability: ${powerstats.durability}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFCCCFD4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    "Combat: ${powerstats.combat}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFCCCFD4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    "Power: ${powerstats.power}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFCCCFD4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    "Intelligence: ${powerstats.intelligence}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFCCCFD4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          } else
            return Column(
              children: [
                for (int i = 0; i < _countShimmers; i++)
                  Shimmer.fromColors(
                      baseColor: Color(0x792B333A),
                      highlightColor: Color(0xFF293946),
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(
                          top: 4,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color(0xFF293946)),
                      )),
              ],
            );
        },
      ),
    );
  }
}

class ImageHeroWidget extends StatelessWidget {
  int heroId;

  ImageHeroWidget({
    Key? key,
    required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageHeroCubit(heroId.toString()),
      child: BlocBuilder<ImageHeroCubit, ImageHero?>(
        builder: (context, imageHero) {
          if (imageHero != null) {
            return Container(
              padding: EdgeInsets.all(10),
              width: 200,
              height: 200,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageHero.url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else
            return Container(
              width: 200,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
        },
      ),
    );
  }
}
