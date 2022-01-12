import 'package:bloc_example/cubit/home_cubit.dart';
import 'package:bloc_example/screens/detail_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C2A33),
        title: Text("List heroes"),
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
        child: BlocBuilder<HomeCubit, Map<int, String>>(
          builder: (context, heroes) {
            var heroesName = heroes.values.toList();
            var heroesIds = heroes.keys.toList();
            return ListView.builder(
                itemCount: heroesName.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color(0x3332414D),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(35, 35)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Color(0xC75DCE5D)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailHeroPage(heroId: heroesIds[index])),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 30,
                        child: Center(
                          child: Text(
                            heroesName[index],
                            style: TextStyle(
                                color: Color(0xFFCCCFD4), fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
