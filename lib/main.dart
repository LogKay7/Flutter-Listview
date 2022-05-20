import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ListView',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: MyHomePage(title: 'Flutter Demo ListView'),

    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

  List<Voiture> _voitures = [

    Voiture('Renault', 'Twingo', 95, 12350, Image.asset('Assets/Images/twingo.png')),
    Voiture('Citroën', 'C5', 131, 25700, Image.asset('Assets/Images/citroen c5.png')),
    Voiture('Ford', 'Focus', 100, 20150, Image.asset('Assets/Images/fordfocus.png')),
    Voiture('Porsche', 'Carrera', 385, 108334, Image.asset('Assets/Images/carerra.png')),
    Voiture('Ferrari', 'F430', 490, 90000, Image.asset('Assets/Images/ferrari.png')),
    Voiture('Audi', 'A7', 204, 62500, Image.asset('Assets/Images/Audi-A7.png')),
    Voiture('BMW', 'M5', 625, 138850, Image.asset('Assets/Images/bmwm5.png')),
    Voiture('Volkswagen', 'Golf 8', 110, 27540, Image.asset('Assets/Images/golf8.png')),
    Voiture('Peugeot', '508', 130, 35300, Image.asset('Assets/Images/peugeot-508.png')),
    Voiture('Nissan', 'Micra', 100, 16190, Image.asset('Assets/Images/nissan-micra.png')),
    Voiture('BMW', 'i8', 231, 141950, Image.asset('Assets/Images/bmw-i8.png')),
    Voiture('Audi', 'RS5', 450, 95000, Image.asset('Assets/Images/rs5.png')),
    Voiture('Opel', 'Astra', 110, 21950, Image.asset('Assets/Images/opel-astra.png')),
    Voiture('Lamborghini', 'Urus', 650, 223361, Image.asset('Assets/Images/lambo.png')),
    Voiture('Audi', 'A1', 95, 20600, Image.asset('Assets/Images/audi-a1.png')),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown[67],
      ),
      body: ListView.builder(
          itemCount: _voitures.length,
          itemBuilder: (context, index) {
            final item = _voitures[index];
            return Dismissible(
              key: Key(item.modele),
              background: Container(
                child: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.cyan,
                ),
              ),
              onDismissed: (direction)
              {
                setState(() {
                  _voitures.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Voiture ${item.modele} supprimée")));
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child : Container(
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(-15.0, 0.0))
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.cyan[50], Colors.cyan[600]],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                  ),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${item.modele}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          '${item.marque}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                                backgroundColor: Colors.cyan,
                                title: Text('${item.marque} ${item.modele}',
                                    style: TextStyle(color: Colors.white)),
                                content: Container(
                                  height: MediaQuery.of(context).size.height /3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      item.image,

                                      Padding(padding: EdgeInsets.only(bottom: 10)),
                                      Text('${item.chevaux} ch',
                                          style: TextStyle(color: Colors.white)),
                                      Padding(padding: EdgeInsets.only(bottom: 5)),
                                      Text('${item.prix} €',
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    ],
                                  ),

                                )
                            );
                          });
                    },
                  ),
                ),

              ),
            );
          }
      ),
    );

  }
}

class Voiture {
  String marque;
  String modele;
  int chevaux;
  int prix;
  Image image;

  Voiture(this.marque, this.modele, this.chevaux, this.prix, this.image);
}