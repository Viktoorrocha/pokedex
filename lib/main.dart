import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex/Pokemon.dart';

    void main() => runApp(new MaterialApp(
      title: "Pokédex",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var url = "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";

    PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodedJson);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke"),
        backgroundColor: Colors.green,
      ),

      body: GridView.count(crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => Padding(
      padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 3.0,
         child: Column(
           mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Container(
               height: 100.0,
               width: 100.0,
               decoration: BoxDecoration(
                 image: DecorationImage(
                     image:  NetworkImage(poke.img))),
             ),
             
             
             Text(poke.name, style: TextStyle(
                 fontSize: 20.0,
               fontWeight: FontWeight.bold,
              )
             )
           ],
         ),
        ),
        )).toList(),
      ),
      drawer: Drawer(),
      floatingActionButton:  FloatingActionButton(
          onPressed:() {},
        backgroundColor: Colors.green,
          child: Icon(Icons.refresh),),
    );
  }
}