import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../perguntas.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> marcadoresPontos = [];
  Perguntas perguntas = Perguntas();
  int corretas = 0;

  void confereResposta(bool resposta){

    setState(() {

      if(perguntas.getPergunta().resposta == resposta ){
        marcadoresPontos.add(Icon(Icons.check, color: Colors.green,));
        corretas++;
      }else{
        marcadoresPontos.add(Icon(Icons.close, color: Colors.red,));
      }

      if(perguntas.ultima()){
        Alert(context: context, title: 'Fim do Quiz??!', desc: 'Voce acertou $corretas de ${perguntas.getQuantidade()} .',).show();
        marcadoresPontos.clear();
        perguntas.reiniciar();
        corretas = 0;
      }else{
        proxima();
      }
    });
  }

  void  proxima(){
    //setState(() {
      perguntas.proxima();
    //});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz - do Wagner')),
        body: (Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                  child: Text(perguntas.getPergunta().enunciado,
                      textAlign: TextAlign.center ,
                      style: TextStyle(
                        fontSize: 25.0,
                      ))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.brown),
                  child: Text(
                    'Verdadeiro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () { confereResposta(true,);},
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.brown),
                  child: Text(
                    'Falso',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () { confereResposta(false,);
                  },
                ),
              ),
            ),
            Expanded(child: GridView.count(crossAxisCount: 11, children: marcadoresPontos.toList(),)),
          ],
        )),
      ),
    );
  }
}
