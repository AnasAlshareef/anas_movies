import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../cubit/movies/favorites/favorites_cubit.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;
 final String originalTitle;
 final String releseDate;
 final String backdrop;
 final String over;
 final double rating;
 final String lang;
 final double pop;
  const MovieDetailScreen({super.key, required this.id,required this.originalTitle, required this.releseDate, required this.backdrop, required this.over, required this.rating, required this.lang, required this.pop});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isPressd = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
                "${widget.originalTitle} (${widget.releseDate})"),
            background: SizedBox(
                width: double.infinity,
                // height: 500,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.backdrop}',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([_buildbodyOfDetails()]),
        ),
      ],
    );
  }

  Widget _buildbodyOfDetails() {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "OverView",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              RatingBar.builder(
                itemSize: 20,
                initialRating: widget.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 9,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_outlined,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.over,
            style: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Language  ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.left,
              ),
              Text(
                "Popularity",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.lang,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 30),
              ),
              Text(
                "${widget.pop}",
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ],
          ),
          IconButton(
            onPressed: (){
              setState(() {
                isPressd = !isPressd;
              });
              if(isPressd ==true){
                BlocProvider.of<FavoritesCubit>(context).addFavorite(widget.id,"movie",true);

              }if( isPressd==false){
                // BlocProvider.of<NowplayinglocalCubit>(context).delFav(widget.nowPlaying);
              }
            },
            icon: Icon(isPressd?Icons.favorite:Icons.favorite_border),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
