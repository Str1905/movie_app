import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/utils.dart';

class NowPlayingMovies extends StatelessWidget {
  final List nowplaying;

  const NowPlayingMovies({Key? key, required this.nowplaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              const modified_text(text: "NowPlaying Movies",size: 26,)
              ,const SizedBox(
                height: 20,
              )
              ,SizedBox(height:270 ,
                child: Builder(
                    builder: (context) {
                      return ListView.builder(itemCount: nowplaying.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (Context,index){
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Description(
                                          name: nowplaying[index]['title'],
                                          bannerurl:
                                          'https://image.tmdb.org/t/p/w500' + nowplaying[index]['backdrop_path'],
                                          posterurl:
                                          'https://image.tmdb.org/t/p/w500' + nowplaying[index]['poster_path'],
                                          description: nowplaying[index]['overview'],
                                          vote: nowplaying[index]['vote_average'].toString(),
                                          launch_on: nowplaying[index]['release_date'],
                                        )));

                              },
                              child: SizedBox(
                                width: 154,
                                child: Column(
                                  children: [
                                    Container(
                                      height:270,
                                      decoration: BoxDecoration(image:
                                      DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/352'+nowplaying[index]['poster_path']
                                          )
                                      )),
                                    ),
                                    modified_text(text:nowplaying[index]['title']!=null? nowplaying[index]['title']:'Loading')
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
