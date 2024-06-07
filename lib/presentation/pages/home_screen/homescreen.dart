import 'package:anas_movies/cubit/movies/nowplaying/nowplaying_cubit.dart';
import 'package:anas_movies/cubit/movies/popular/popular_cubit.dart';
import 'package:anas_movies/cubit/movies/toprated/toprated_cubit.dart';
import 'package:anas_movies/cubit/movies/upcoming/upcoming_cubit.dart';
import 'package:anas_movies/presentation/widgets/movies/nowplayingcard.dart';
import 'package:anas_movies/presentation/widgets/movies/popularmoviescard.dart';
import 'package:anas_movies/presentation/widgets/movies/topmoviescard.dart';
import 'package:anas_movies/presentation/widgets/movies/upcomingcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NowplayingCubit>(context).getNowPlaying();
    BlocProvider.of<PopularCubit>(context).getpopular();
    BlocProvider.of<TopratedCubit>(context).getTopReted();
    BlocProvider.of<UpcomingCubit>(context).getUpcoming();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
        //drawer: const Drawer(backgroundColor: Colors.white,surfaceTintColor: Colors.white,),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
          elevation: 0,
          centerTitle: true,
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Anas's",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                TextSpan(
                  text: "Movies",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          // physics: const ClampingScrollPhysics(),
          child: Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Now Playing",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<NowplayingCubit, NowplayingState>(
                    builder: (context, state) {
                  if (state is NowplayingDone) {
                    final now = state.nowplaying;
                    return SizedBox(
                      width:500,
                      height: 310,
                      child: ListView.separated(
                        //  physics:  ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: now.length,
                        itemBuilder: (context, int index) {
                          return NowPlayingCards(
                            nowplaying: now[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Popular ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                BlocBuilder<PopularCubit, PopularState>(
                  builder: (context, state) {
                    if (state is PopularDone) {
                      final pop = state.popular;
                      return SizedBox(
                        width: 500,
                        height: 310,
                        child: ListView.separated(
                          //  physics:  ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: pop.length,
                          itemBuilder: (context, int index) {
                            return PopularMoviesCard(movies: pop[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.black,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "TopRated",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                BlocBuilder<TopratedCubit, TopratedState>(
                  builder: (context, state) {
                    if (state is TopratedDone) {
                      final top = state.top;
                      return SizedBox(
                        width: 500,
                        height: 310,
                        child: ListView.separated(
                          //  physics:  ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: top.length,
                          itemBuilder: (context, int index) {
                            return TopRatedCard(toprated: top[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Up Coming",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                BlocBuilder<UpcomingCubit, UpcomingState>(
                  builder: (context, state) {
                    if (state is UpcomingDone) {
                      final up = state.upcoming;
                      return SizedBox(
                        width: 500,
                        height: 310,
                        child: ListView.separated(
                          //  physics:  ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: up.length,
                          itemBuilder: (context, int index) {
                            return UpComingCard(upcoming: up[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      );
                    }else{
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
