import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterkit/db/Todo.dart';
import 'package:flutterkit/db/database.dart';
import 'dart:math' as math;

class Offline extends StatefulWidget {
  @override
  _OfflineState createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {

  DBProvider dbProvider = DBProvider();
  List<Todo> testTodo = [
    Todo(id: 1, task: "Buy Milk", completed: false),
    Todo(id: 2, task: "Call Sam", completed: false),
    Todo(id: 3, task: "Pay Telephone bill", completed: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawers(),
      appBar: AppBar(
         // title: Text( AppLocalizations.of(context)!.offline),
          backgroundColor: Palette.navigationBar
      ),
      body: FutureBuilder<List<Todo>>(
        future: dbProvider.getAllTodo(),
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Todo item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    dbProvider.deleteTodo(item.id);
                  },
                  child: ListTile(
                    title: Text(item.task),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        dbProvider.completeOrUnComplete(item);
                        setState(() {});
                      },
                      value: item.completed,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Todo rnd = testTodo[math.Random().nextInt(testTodo.length)];
          await dbProvider.addTodo(rnd);
          setState(() {});
        },
      ),
    );
  }
}
