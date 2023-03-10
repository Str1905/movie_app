import 'package:flutter/material.dart';
import 'package:movie_app/utils/utils.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
           crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          const modified_text(text: "Trending Movies",color: Colors.transparent,size: 26,)
          ,const SizedBox(
            height: 10,
          )
         ,SizedBox(height:270 ,
          child: Builder(
            builder: (context) {
              return ListView.builder(itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (Context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                              name: trending[index]['title'],
                              bannerurl:
                              'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                              posterurl:
                              'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                              description: trending[index]['overview'],
                              vote: trending[index]['vote_average'].toString(),
                              launch_on: trending[index]['release_date'],
                            )));

                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(image:
                          DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/500'+trending[index]['poster_path']
                              )
                          )),
                        ),
                        Container(child: modified_text(text:trending[index]['title']!=null?
                        trending[index]['title']:'Loading'))
                      ],
                    ),
                  ),
                );
              }
              );
            }
          ),)
        ]
      )
    );
  }
}
