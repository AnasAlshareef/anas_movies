import 'package:anas_movies/cubit/movies/favorites/favorites_cubit.dart';
import 'package:anas_movies/data/models/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoritesCards extends StatefulWidget {
  final Favorites? favorites;
  const FavoritesCards({super.key, required this.favorites});

  @override
  State<FavoritesCards> createState() => _FavoritesCardsState();
}

class _FavoritesCardsState extends State<FavoritesCards> {
  bool isvisibale = false;
  bool isPressd= true;
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      child: Column(
        children: [
          InkWell(
            onLongPress: () {
              setState(() {
                isvisibale = true;
              });
            },
            onTapCancel: () {
              setState(() {
                isvisibale = false;
              });
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.favorites!.posterPath}',
                    width: 210,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // top: 130,
                  child: Visibility(
                    visible: isvisibale,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      alignment: Alignment.bottomCenter,
                      width: 210,
                      height: 300,
                      //color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                            child: Text(

                              "${widget.favorites!.title} (${widget.favorites
                              !.releaseDate})",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
                            child: Text(
                              "${widget.favorites!.overview}",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              isPressd = !isPressd;
                            });
                            if(isPressd==false){
                              BlocProvider.of<FavoritesCubit>(context).addFavorite(widget.favorites!.id!, "movie", false);
                            }
                          },
                            icon: Icon(isPressd?Icons.favorite:Icons.favorite_border),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
