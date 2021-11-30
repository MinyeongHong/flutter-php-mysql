import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AddEditPage.dart';

void main() {
  runApp(
    HomeApp(),
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future getData()async{
    var url = 'http://192.168.0.22/contents/read.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Php Mysql Crud'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(),),);
            debugPrint('Clicked FloatingActionButton Button');
          },
        ),
        body: FutureBuilder(
        future: getData(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  List list = snapshot.data;
                  return ListTile(
                    leading: GestureDetector(child: Icon(Icons.edit),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(list: list,index: index,),),);
                        debugPrint('Edit Clicked');
                      },),
                    title: Text(list[index]['first']+list[index]['last']),
                    subtitle: Text(list[index]['age']),
                    trailing: GestureDetector(child: Icon(Icons.delete),
                      onTap: (){
                        setState(() {
                          var url = 'http://172.30.1.26/People/delete.php';
                          http.post(Uri.parse(url),body: {
                            'id' : list[index]['id'],
                          });
                        });
                        debugPrint('delete Clicked');
                      },),
                  );
                }
            )
                : CircularProgressIndicator();
          },
        ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        //centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                List list = snapshot.data;
                return ListTile(

                  title: Text(list[index]['title']),
                  subtitle: Text(list[index]['poster']),

                );
              }
          )
              : CircularProgressIndicator();
        },
      ),

    );
  }

}
