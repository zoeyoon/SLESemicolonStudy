import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}'); //아이템리스트 초기화

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder( //scroll이 되는 리스트뷰
          itemCount: items.length, //item길이 만큼, 위에 20으로 정의 되어 있음
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible( //반드시 키를 만들어서 넘겨주어야한다 (아이템 하나하나가 어떤 것인지 알 수 있게)
              key: Key(item),
              onDismissed: (direction) { //스와이프 했을때 어떤 액션이 일어나는지 -> 스와이프 할 때 마다 아이템 length가 줄어들게 된다
                setState(() { //플러터가 화면을 다시 그리게 된다
                  items.removeAt(index);
                });
 
                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.grey,
                child: const Icon(Icons.delete, color: Colors.white),
                alignment: Alignment.centerLeft,
                ),
              direction: DismissDirection.startToEnd,
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      ),
    );
  }
}