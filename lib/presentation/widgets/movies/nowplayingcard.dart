import 'package:anas_movies/cubit/movies/favorites/favorites_cubit.dart';
import 'package:anas_movies/data/models/nowplaying.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCards extends StatefulWidget {
  final NowPlaying? nowplaying;

  const NowPlayingCards({super.key, this.nowplaying});

  @override
  State<NowPlayingCards> createState() => _NowPlayingCardsState();
}

class _NowPlayingCardsState extends State<NowPlayingCards> {
  bool isvisibale = false;
  bool isPressd = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //BlocProvider.of<FavoritesCubit>(context).addFavorite(widget.nowplaying!.id!, "movie",k!);
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
            onTap: () {
              Navigator.of(context).pushNamed(
                  'NowplayingDetails', arguments: widget.nowplaying);
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
                      'https://image.tmdb.org/t/p/w500${widget.nowplaying!
                          .posterPath}',
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
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: Text(

                                "${widget.nowplaying!.title} (${widget
                                    .nowplaying!.releaseDate})",
                                style: const TextStyle(

                                    fontSize: 15, color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 5, right: 5, top: 5),
                              child: Text(

                                "${widget.nowplaying!.overview}",
                                style: const TextStyle(

                                    fontSize: 15, color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            BlocBuilder<FavoritesCubit, FavoritesState>(
                              builder: (context, state) {
                                bool k = false;
                                if(state is FavoritesAdded) {
                                   k = state.isFav;}
                                  return IconButton(

                                    icon: Icon(
                                   k
                                            ? Icons.favorite
                                            : Icons.
                                        favorite_border),
                                    color: !k? Colors.red : Colors.grey,
                                    onPressed: () {
                                      if(k==false){
                                        BlocProvider.of<FavoritesCubit>(context)
                                          .addFavorite(
                                          widget.nowplaying!.id!, "movie",
    true);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            const SnackBar(content: Text(
                                                "Movie Added to Favorite!")));
                                      }
                                      if(k == true){
                                        BlocProvider.of<FavoritesCubit>(context)
                                            .addFavorite(
                                            widget.nowplaying!.id!, "movie",
    false);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            const SnackBar(content: Text(
                                                "Movie Removed from Favorite!")));
                                      }


                                    },
                                  );

                                },
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
