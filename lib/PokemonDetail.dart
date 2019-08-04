import 'package:flutter/material.dart';
import 'package:pokedex/Pokemon.dart';


class PokeDetail extends StatelessWidget {

  final  Pokemon pokemon;

  const PokeDetail({Key key, this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    bodyWidget(BuildContext context) => Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  SizedBox(
                  height: 100.0,
                ),
                  Text(pokemon.name, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                  Text("Altura: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text("Tipos", style: TextStyle(fontWeight: FontWeight.bold),),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type.map((t) =>
                        FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(t), onSelected: (b){})).toList(),
                  ),
                  Text("Fraqueza", style: TextStyle(fontWeight: FontWeight.bold)),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses.map((t) =>
                        FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(t, style: TextStyle(color: Colors.white),), onSelected: (b){})).toList(),
                  ),
                  Text("Próxima Evolução", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution.map((n) =>
                        FilterChip(
                            backgroundColor: Colors.green,
                            label: Text(n.name,style: TextStyle(color: Colors.white)), onSelected: (b){})).toList(),
                  ),


                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(tag: pokemon.img, child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover,image:NetworkImage(pokemon.img))
            ),
          ),),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.green,
        title: Text(pokemon.name),
      ),

      body: bodyWidget(context),
    );
  }
}