import 'package:dhaka_city/layouts/Post.dart';
import 'package:dhaka_city/secret/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  _State createState()=> _State();
}

class _State extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: fetchWpCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map myposts = snapshot.data[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                      id:myposts['id'],
                    )));
                    },
                    child: Card(
                      color: Colors.teal,
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(myposts['name'],style: TextStyle(fontSize: 35),),
                            ),
                          ),
                        ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}