import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/utils.dart';

class TopRatedMovies extends StatelessWidget {
  final List Toprated;

  const TopRatedMovies({Key? key, required this.Toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              const modified_text(text: "TopRated Movies",size: 26,)
              ,const SizedBox(
                height: 10,
              )
              ,SizedBox(height:270 ,
                child: Builder(
                    builder: (context) {
                      return ListView.builder(itemCount: Toprated.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (Context,index){
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Description(
                                          name: Toprated[index]['title'],
                                          bannerurl:
                                          'https://image.tmdb.org/t/p/w500' + Toprated[index]['backdrop_path'],
                                          posterurl:
                                          'https://image.tmdb.org/t/p/w500' + Toprated[index]['poster_path'],
                                          description: Toprated[index]['overview'],
                                          vote: Toprated[index]['vote_average']
                                              .toString(),
                                          launch_on: Toprated[index]
                                          ['release_date'],
                                        )));

                              },
                              child: SizedBox(
                                width: 154,
                                child: Column(
                                  children: [
                                    Container(
                                      height:200,
                                      decoration: BoxDecoration(image:
                                      DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/500'+Toprated[index]['poster_path']
                                          )
                                      )),
                                    ),
                                    Container(child: modified_text(text:Toprated[index]['title']!=null?
                                    Toprated[index]['title']:'Loading'))
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
