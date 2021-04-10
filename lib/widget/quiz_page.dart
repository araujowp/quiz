import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> marcadoresPontos = [
    Icon(Icons.check, color: Colors.green,),
    Icon(Icons.close, color: Colors.red,),
    Icon(Icons.check, color: Colors.green,),
  ];
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
                  child: Text('Pergunta que eu respondo pequeno gafanhoto!',
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
                  onPressed: () {},
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
                  onPressed: () {},
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
