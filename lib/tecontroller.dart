import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  final myController = TextEditingController();

  get actions => null;

  @override
  void initState() {
    super.initState(); //앱이 초기화 되었을때 controller에 addListener을 등록

    myController.addListener(_printLatestValue); //감시하고 있다 어떠한 이벤트 발생 시 괄호 안에 있는 함수 실행
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField( // 첫번째 텍스트필드
              onChanged: (text) {
                print('First text field: $text');
              },
            ),
            TextField( // 두번째 텍스트필드
              controller: myController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () { 
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('confirm input message'),
                content: Text(myController.text),
                actions: <Widget> [
                  TextButton (
                    child: const Text('cancel'),
                    onPressed: () { 
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton (
                    child: const Text('ok'),
                    onPressed: () { 
                      Navigator.of(context).pop();
                    },
                  )
                ]
              );
            },
          );
        },
      ),
    );
  }
}