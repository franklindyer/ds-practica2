import 'package:flutter/material.dart';
import 'package:practica2/EstructuraInvernadero.dart';
import 'package:practica2/Iluminacion.dart';
import 'package:practica2/Macetero.dart';
import 'package:practica2/Manager.dart';
import 'package:practica2/Invernadero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Aplicación de gestión de invernaderos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  Manager managerInvernaderos = new Manager();
  Invernadero? invernaderoSeleccionado;


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

  void _crearInvernaderoInvernal() {
    setState(() {
      managerInvernaderos.crearInvernaderoInvernal();
    });
  }

  void _crearInvernaderoEstival() {
    setState(() {
      managerInvernaderos.crearInvernaderoEstival();
    });
  }

  void _seleccionarInvernadero(int indice) {
    setState(() {
      _counter = indice;
      invernaderoSeleccionado = managerInvernaderos.getInvernadero(indice);
    });
  }

  // Problema posible:
  //  Podría ser ineficiente general la lista de botones de nuevo cada vez.
  //  Por otro lado, si se mantiene una lista de botones, será difícil mantener la consistencia
  //    cada vez que se crea o se borra un invernadero.
  List<Widget> listaBotonesInvernaderos() {
    List<Widget> botones = [];
    //botones.add(Center(child: textoInfoInvernadero()));
    for (int i = 0; i < managerInvernaderos.getNumInvernaderos(); i++) {
      Invernadero invernadero = managerInvernaderos.getInvernadero(i) ?? Invernadero(); // Si el resultado es null, crea un nuevo objeto Invernadero
      botones.add(ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InvernaderoInfo(
                        invernadero: invernadero,
                        id: i,
                        manager: managerInvernaderos,
                      ),
                    ),
                  );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[100],
              ),
              child: Text("Invernadero ${i + 1}"),
            ));
    }
    return botones;
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
        child: ListView(
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
          children: new List.from(listaBotonesInvernaderos())..addAll(<Widget>[
            const Text("Pulse el invernadero para gestionarlo"),
            ElevatedButton(
              onPressed: () {
                _crearInvernaderoInvernal();
                _counter++;
              },
              child: const Text("Nuevo invernadero invernal"),
            ),
            ElevatedButton(
              onPressed: () {
                _crearInvernaderoEstival();
                _counter++;
              },
              child: const Text("Nuevo invernadero estival"),
            ),
          ]),
        ),
      ),
    );
  }
}


class InvernaderoInfo extends StatefulWidget {
  final Invernadero invernadero;
  final int id;
  final Manager manager;

  InvernaderoInfo({required this.invernadero, required this.id, required this.manager});

  @override
  _InvernaderoInfoState createState() => _InvernaderoInfoState();
}

class _InvernaderoInfoState extends State<InvernaderoInfo> {
  void _eliminarInvernadero() {
    setState(() {
      Manager manager = Manager();
      manager.eliminarInvernadero(widget.id);
      Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
    });
  }

  void _incrementarFertilizante(){
    setState(() {
      double? valor = widget.invernadero.condiciones?.fertilizante;
    if(valor != null) {
      widget.invernadero.condiciones?.fertilizante += 1;
    } else{
        widget.invernadero.condiciones?.fertilizante ??= 0.0;
    }
    });
  }

  void _disminuirFertilizante(){
    setState(() {
      double? valor = widget.invernadero.condiciones?.fertilizante;
    if(valor != null) {
      widget.invernadero.condiciones?.fertilizante -= 1;
    } else{
        widget.invernadero.condiciones?.fertilizante ??= 0.0;
    }
    });
  }

  void _incrementarTemperatura(){
    setState(() {
      double? valor = widget.invernadero.condiciones?.temperatura;
    if(valor != null) {
      widget.invernadero.condiciones?.temperatura += 1;
    } else{
        widget.invernadero.condiciones?.temperatura ??= 0.0;
    }
    });
  }

  void _disminuirTemperatura(){
    setState(() {
      double? valor = widget.invernadero.condiciones?.temperatura;
    if(valor != null) {
      widget.invernadero.condiciones?.temperatura -= 1;
    } else{
        widget.invernadero.condiciones?.temperatura ??= 0.0;
    }
    });
  }

    void _incrementarHumedad(){
    setState(() {
      double? valor = widget.invernadero.condiciones?.humedad;
    if(valor != null) {
      widget.invernadero.condiciones?.humedad += 1;
    } else{
        widget.invernadero.condiciones?.humedad ??= 0.0;
    }
    });
  }

  void _disminuirHumedad(){
    setState(() {
      double? valor = widget.invernadero.condiciones?.humedad;
    if(valor != null) {
      widget.invernadero.condiciones?.humedad -= 1;
    } else{
        widget.invernadero.condiciones?.humedad ??= 0.0;
    }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invernadero ${widget.id + 1}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Información del invernadero ${widget.id + 1}\n'),
            Text(widget.invernadero.infoInvernadero()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.invernadero.setMaceteros(new Macetero(true));
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                  ),
                  child: Text('Activar macetero'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.invernadero.setMaceteros(new Macetero(false));
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                  ),
                  child: Text('Desactivar macetero'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.invernadero.setIluminacion(new Iluminacion(true));
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                  ),
                  child: Text('Activar iluminacion'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.invernadero.setIluminacion(new Iluminacion(false));
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                  ),
                  child: Text('Desactivar iluminacion'),
                ),
              ],
             ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.invernadero.setEstructura(new EstructuraInvernadero(true));
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                  ),
                  child: Text('Reforzar estructura'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.invernadero.setEstructura(new EstructuraInvernadero(false));
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                  ),
                  child: Text('No reforzar estructura'),
                ), 
              ],
             ),
             SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _incrementarFertilizante();
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('+ fertilizante'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _disminuirFertilizante();
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('- fertilizante'),
                ), 
              ],
             ),
              SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _incrementarTemperatura();
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('+ temperatura'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _disminuirTemperatura();
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('- temperatura'),
                ), 
              ],
             ),
             SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _incrementarHumedad();
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('+ humedad'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _disminuirHumedad();
                    });
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('- humedad'),
                ), 
              ],
             ),
             SizedBox(height: 16.0),
             ElevatedButton(
              onPressed: () {
                setState(() {
                  // Elimina el invernadero de la lista
                  widget.manager.eliminarInvernadero(widget.id);
                  // Vuelve a la pantalla principal
                  Navigator.pop(context);
                });
              },
              child: Text('Eliminar Invernadero'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: Size(double.infinity, 50),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
