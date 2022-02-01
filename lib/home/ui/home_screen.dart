import 'package:flutter/material.dart';
import 'package:githubactionsflutter/home/model/album.dart';
import 'package:githubactionsflutter/webservice/webservice.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final webservice = Webservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key("home_app"),
        title: Text("HomeScreen"),
      ),
      body: FutureBuilder<Album>(
          future: webservice.fetchAlbum(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData &&
                snapshot.data != null) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(snapshot.data!.id.toString()),
                      title: Text(snapshot.data!.title),
                      subtitle: Text(snapshot.data!.userId.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 10);
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
