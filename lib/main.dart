import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
    
  String nombres = "";
  String curso = "";
  double nota1 = 0.0;
  double nota2 = 0.0;
  double nota3 = 0.0;
  double nota4 = 0.0;
  double promedio = 0.0;
  String mensaje = "";
  bool validacion = false;
  String title = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _tfNombres=TextEditingController();
  final _tfCurso=TextEditingController();
  final _tfNota1=TextEditingController();
  final _tfNota2=TextEditingController();
  final _tfNota3=TextEditingController();
  final _tfNota4=TextEditingController();

  void _calcularPromedio(){
    setState(() {
      widget.validacion = false;
      if(_tfNota1.text.toString()=="" ||
         _tfNota2.text.toString()=="" ||
         _tfNota3.text.toString()=="" ||
         _tfNota4.text.toString()=="" ){
            widget.validacion = true;
            widget.mensaje = "Falta ingresar la nota";
            return;
         }
         widget.nota1 = double.parse(_tfNota1.text);
         widget.nota2 = double.parse(_tfNota2.text);
         widget.nota3 = double.parse(_tfNota3.text);
         widget.nota4 = double.parse(_tfNota4.text);

         widget.promedio = (widget.nota1 + widget.nota2 + widget.nota3 + widget.nota4) / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Notas " + widget.title),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Para calcular completa los datos y da click en el botón calcular"),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
                children: <Widget>[
                  TextField(
                    controller: _tfNombres,
                    decoration: InputDecoration(
                      hintText: "Ingrese Nombres",
                      labelText: "Nombres",
                    )
                  ),
                  TextField(
                    controller: _tfCurso,
                    decoration: InputDecoration(
                      hintText: "Ingrese un curso",
                      labelText: "Curso",
                    )
                  ),
                  TextField(
                    controller: _tfNota1,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Ingrese Nota 1",
                      labelText: "Nota 1",
                      errorText: _tfNota1.text.toString()==""?widget.mensaje:null,
                    )
                  ),
                  TextField(
                    controller: _tfNota2,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Ingrese Nota 2",
                      labelText: "Nota 2",
                      errorText: _tfNota1.text.toString()==""?widget.mensaje:null,
                    )
                  ),
                  TextField(
                    controller: _tfNota3,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Ingrese Nota 3",
                      labelText: "Nota 3",
                      errorText: _tfNota1.text.toString()==""?widget.mensaje:null,
                    )
                  ),
                  TextField(
                    controller: _tfNota4,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Ingrese Nota 4",
                      labelText: "Nota 4",
                      errorText: _tfNota1.text.toString()==""?widget.mensaje:null,
                    )
                  ),
                  Text("Promedio: " + widget.promedio.toString()),
                  RaisedButton(
                    color: Colors.red[300],
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                      ),
                    onPressed: _calcularPromedio,
                    )
                ],
            ),
          )
        ],
      )
    );
  }
}
