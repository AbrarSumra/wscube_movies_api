import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClients;
import 'package:wscube_movies_api/models/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? movieModel;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
        ),
        body: movieModel != null
            ? ListView.builder(
                itemCount: movieModel!.movie.length,
                itemBuilder: (_, index) {
                  var movie = movieModel!.movie[index];
                  return ListTile(
                    title: Text(movie.movie),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  void getMovies() async {
    var uri = Uri.parse("https://dummyapi.online/api/movies#");
    var response = await httpClients.get(uri);

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      movieModel = DataModel.fromJson(mData);
      setState(() {});
    }
  }
}
