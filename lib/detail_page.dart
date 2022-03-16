import 'package:flutter/material.dart';
import 'package:kuis/data_dummy.dart';

class DetailPage extends StatelessWidget {
  final DataMovie movie;
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          _poster(),
          _descCard(movie)
        ],
      )
    );
  }

  Widget _poster(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Image.network(movie.poster_path, width: 150,)
    );
  }

  Widget _descCard(DataMovie movie){
    return Container(
        child: Center(
          child: Column(
            children: [
              Text(movie.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Text('Language : ' + movie.original_language),
              Text('Popularity : ' +'${movie.popularity}'),
              Text('Vote Count : ' + '${movie.vote_count}'),
              Text('Vote Average : ' + '${movie.vote_average}')
          ],
        ),
      )
    );
  }
}

