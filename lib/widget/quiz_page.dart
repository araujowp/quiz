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

  List<bool> respostas = [];


  void confereResposta(bool resposta){
    if(perguntas.getPergunta().resposta == resposta ){
      print('acertou miseravel');
      respostas.add(true);
      marcadoresPontos.add(Icon(Icons.check, color: Colors.green,));
    }else{
      print('errou lazarento');
      respostas.add(false);
      marcadoresPontos.add(Icon(Icons.close, color: Colors.red,));
    }
    proxima();
  }

  void  proxima(){
    setState(() {
      Alert(
        context: context,
        title: 'Fim do Quiz!',
        desc: 'Você respondeu a todas as perguntas.',
      ).show();
      perguntas.proxima();
    });
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
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.deepPurple,
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
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.deepPurple,
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
            Row(children: marcadoresPontos,)
          ],
        )),
      ),
    );
  }
}
