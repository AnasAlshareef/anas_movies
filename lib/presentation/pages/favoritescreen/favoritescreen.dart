import 'package:anas_movies/cubit/movies/favorites/favorites_cubit.dart';
import 'package:anas_movies/presentation/widgets/favoratiesmovies/favoraties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoritesCubit>(context).getFavorites();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
          title: const Text(
            'Favorites',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesDone) {
              final favorites = state.favorites;
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  //color: Colors.grey,
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 1 / 3,
                          mainAxisSpacing: 1,
                        ),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: favorites.length,
                        itemBuilder: (ctx, index) {
                          return FavoritesCards(
                            favorites: favorites[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.white,));
            } if(state is FavoritesError) {
              final str = state.Error;
              return Center(
                child: Container(
                  width: 50,
                  color: Colors.white,
                  child: Text(str,style: const TextStyle(color: Colors.black),),
                ),
              );
            }else{
              return Container(
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
