import 'package:flutter/material.dart';
import 'package:movie_app/widgets/nowplayingmovies.dart';
import 'package:movie_app/widgets/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../utils/utils.dart';
import '../widgets/topratedmovies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String apiKey = 'a08e4412cfb8ea4b413dd0f7f305b1ae';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDhlNDQxMmNmYj'
      'hlYTRiNDEzZGQwZjdmMzA1YjFhZSIsInN1YiI6IjYzYWQzNTgzYzgxMTNkMDBhZTQwMmF'
      'jZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-sA0IppAIeAMu_kbmy'
      'w3bIRoikGWifKaRjNUAOmUoVQ';
  List trendingMovies = [];
  List topratedmovies = [];
  List nowplayingmovies = [];
  @override
  void initState(){
    loadmovies();
    super.initState();
  }
  loadmovies() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey,readAccessToken));
    const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    print(topratedresult);
    print(nowplayingresult);
    print(trendingresult);
    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      nowplayingmovies = nowplayingresult['results'];
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const modified_text( text:'flutter Movie App'),
            //Center(
            // actions: <Widget>[
            //   ElevatedButton(
            //       child: const Text("Logout"),
            //       onPressed: () {
            //         FirebaseAuth.instance.signOut().then((value) {
            //           print("Signed Out");
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => const SignInScreen())
            //           );
            //         },
            //
            //         );
            //       })
            //   //)
            //
            // ]
        ),
        body:ListView(
          children: [
            TrendingMovies(trending: trendingMovies),
            TopRatedMovies(Toprated: topratedmovies),
            NowPlayingMovies(nowplaying: nowplayingmovies)
          ],
        )
    );


  }
}