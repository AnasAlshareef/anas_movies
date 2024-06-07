import 'package:anas_movies/data/models/popularmovies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/movies/favorites/favorites_cubit.dart';
class PopularMoviesCard extends StatefulWidget {
  final PopularMovies? movies;
  const PopularMoviesCard({super.key, required this.movies});

  @override
  State<PopularMoviesCard> createState() => _PopularMoviesCardState();
}

class _PopularMoviesCardState extends State<PopularMoviesCard> {
  bool isvisibale = false;
  bool isPressd= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isPressd = !isPressd;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('popularDetails',arguments: widget.movies);
            },
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
            child: Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.movies!.posterPath}',
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

                                "${widget.movies!.title} (${widget.movies!.releaseDate})",
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

                                "${widget.movies!.overview}",
                                style: const TextStyle(

                                    fontSize: 15, color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  isPressd = !isPressd;
                                });
                                if(isPressd==true){
                                  BlocProvider.of<FavoritesCubit>(context).addFavorite(widget.movies!.id!,"movie",true);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Movie Added to Favorite!")));
                                }if(isPressd==false){
                                  BlocProvider.of<FavoritesCubit>(context).addFavorite(widget.movies!.id!,"movie",false);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Movie deleted from Favorite!")));
                                }
                              },
                              icon: Icon(isPressd?Icons.favorite:Icons.favorite_border),
                              color: Colors.white,
                            )

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
