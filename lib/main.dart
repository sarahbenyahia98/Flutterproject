import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp( DetailPage());
}

//======================================================================
//                          Detail SCREEN
//======================================================================

class DetailPage extends StatelessWidget {
  //const DetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Devils May Cry 5'),
        ),
        body: Column(children: [
        Card(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [ Center (child:  Image.asset('Assets/dmc5.jpg', width: 400,),),
           
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Devil May Cry 5 (parfois abrégé DMC 5) est un jeu vidéo d action japonais de type beat them all développé par Capcom Production Studio 1 et édité par Capcom, sorti le 8 mars 2019 sur PlayStation 4, Xbox One et Windows. Une version remasterisée, Devil May Cry 5 Special Edition, est sortie sur PlayStation 5 et Xbox Series le jour du lancement des consoles. ', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                    child: Text('200 TND', textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                    child: ElevatedButton (
                       child: Row (
                           children: [
                          Icon(Icons.shopping_basket),
                          SizedBox(width: 5),
                                Text("Acheter")
                              ],
                             ) ,
                           onPressed: () {},
),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
          
        ],),
      ),
    );
  }
}



//======================================================================
//                          INSCRI SCREEN
//======================================================================
class InscriPage extends StatelessWidget {
  const InscriPage({ Key? key }) : super(key: key);

  @override
   State<InscriPage > createState() => _SignupState();
  
}

//======================================================================
   //                    SignupState
//======================================================================
class _SignupState extends State<InscriPage> {
  late String? _username;
  late String? _email;
  late String? _password;
  late String? _birth;
  late String? _address;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final String _baseUrl = "10.0.2.2:9090";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
                onSaved: (String? value) {
                  _username = value;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "Le username ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "Le username doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                onSaved: (String? value) {
                  _email = value;
                },
                validator: (String? value) {
                  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                  if(value == null || value.isEmpty) {
                    return "L'adresse email ne doit pas etre vide";
                  }
                  else if(!RegExp(pattern).hasMatch(value)) {
                    return "L'adresse email est incorrecte";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
                onSaved: (String? value) {
                  _password = value;
                },
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Année de naissance"),
                onSaved: (String? value) {
                  _birth = value;
                },
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "L'année de naissance ne doit pas etre vide";
                  }
                  else if(int.parse(value.toString()) > 2021) {
                    return "L'année de naissance est incorrecte";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Adresse de facturation"),
                onSaved: (String? value) {
                  _address = value;
                },
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "L'adresse email ne doit pas etre vide";
                  }
                  else if(value.length < 20) {
                    return "Le mot de passe doit avoir au moins 20 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("S'inscrire"),
                  onPressed: () {
                    if(_keyForm.currentState!.validate()) {
                      _keyForm.currentState!.save();

                      Map<String, dynamic> userData = {
                        "username": _username,
                        "password" : _password,
                        "email" : _email,
                        "birth" : _birth,
                        "address" : _address
                      };

                      Map<String, String> headers = {
                        "Content-Type": "application/json; charset=UTF-8"
                      };

                      http.post(Uri.http(_baseUrl, "/user/signup"), headers: headers, body: json.encode(userData))
                          .then((http.Response response) {
                        if(response.statusCode == 201) {
                          Navigator.pushReplacementNamed(context, "/");
                        }
                        else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Information"),
                                  content: Text("Une erreur s'est produite. Veuillez réessayer !"),
                                );
                              });
                        }
                      });
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Annuler"),
                  onPressed: () {
                    _keyForm.currentState!.reset();
                    Navigator.pushReplacementNamed(context, "/");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//======================================================================
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
