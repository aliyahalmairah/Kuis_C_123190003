import 'package:kuis/data_dummy.dart';
import 'package:kuis/detail_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  var dataFilm = getDataMovie;

  ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
      ),
      body: Container(
        child: _listView(),
      ),
    );
  }

  Widget _listView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataFilm[index], context);
      },
      itemCount: dataFilm.length,
      separatorBuilder: (BuildContext context, int index) {
        return _separator();
      },
    );
  }

  Widget _createCard(DataMovie movie, BuildContext context){
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailPage(movie: movie);
          }));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Image.network(movie.poster_path, width: 100,),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      movie.overview,
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Popularity ${movie.popularity}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                )
            ),

          ]),
        ),
      ),
    );
  }

  Widget _separator() {
    return Container(
      color: Colors.white24,
    );
  }
}
