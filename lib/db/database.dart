import 'dart:io';

import 'package:flutterkit/db/Todo.dart';
import 'package:flutterkit/networking/model/Movie.dart';
import 'package:flutterkit/networking/model/MoviesList.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  bool isTableCreated = false;
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    print("path ---->"+path);
    return openDatabase(
      join(path, 'flutter_starter_kit.db'),
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE Todo ("
            "id INTEGER PRIMARY KEY,"
            "task TEXT,"
            "completed BIT"
            ")");
      },
      version: 1,
    );
  }

  addTodo(Todo newTodo) async {
    print(newTodo.id);
    print(newTodo.task);
    print(newTodo.completed);
    // final db = await DBProvider.db.database;
    final db = await initializeDB();
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Todo");
    int id = table.first["id"] == null ? 1 : table.first["id"] as int;
    //insert to the table using the new id
 print("offline id is $id");
    var raw = await db.rawInsert(
        "INSERT Into Todo (id,task,completed)"
            " VALUES (?,?,?)",
        [id, newTodo.task, newTodo.completed]);
    print(" insert raw ---- > $raw");

    return raw;
  }

  getTodo(int id) async {
    final db = await initializeDB();
    var res =await  db.query("Todo", where: "id = ?", whereArgs: [id]);
    print("res    ----- ");
    print(res);
    return res.isNotEmpty ? Todo.fromJson(res.first) : Null ;
  }

  Future<List<Todo>> getAllTodo() async {
    final db = await initializeDB();
    var res = await db.query("Todo");
    print("res    ----- ");
    print(res);
    print("res   end  ----- ");
    print(res.map((c) => Todo.fromJson(c)));
    List<Todo> list = res.isNotEmpty ? res.map((c) => Todo.fromJson(c)).toList() : [];
    print("new res    ----- ");
    print(res);
   // print(list);
    return list;
  }

  getCompletedTodo() async {
    final db = await initializeDB();
    var res = await db.rawQuery("SELECT * FROM Todo WHERE completed=1");
    List<Todo> list =
    res.isNotEmpty ? res.map((c) => Todo.fromJson(c)).toList() : [];
    return list;
  }

  completeOrUnComplete(Todo todo) async {
    final db = await initializeDB();
    Todo updatedTodo = Todo(
        id: todo.id,
        task: todo.task,
        completed: !todo.completed);
    var res = await db.update("Todo", updatedTodo.toJson(),
        where: "id = ?", whereArgs: [todo.id]);
    return res;
  }

  deleteTodo(int id) async {
    final db = await initializeDB();
    db.delete("Todo", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    // final db = await DBProvider.db.database;
    final db = await initializeDB();
    db.rawDelete("Delete * from Todo");
  }

 // >>>> Value for Movie List
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      return await initializeDBWithMovieData();
    }
    return _database;
  }

  Future<Database> initializeDBWithMovieData() async {

    return  openDatabase(join(await getDatabasesPath(), 'flutter_starter_kit.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE Movie ("
                  "id TEXT ,"
                  "rank TEXT,"
                  "title TEXT,"
                  "fullTitle TEXT,"
                  "year TEXT,"
                  "image TEXT,"
                  "crew TEXT,"
                  "imDbRating TEXT,"
                  "imDbRatingCount TEXT,"
                  "imageBytes TEXT"
                  ")");
        },);
  }

  addMovie(Movie newMovie) async {

    final db = await initializeDBWithMovieData();
    //print("database is $db");

    // await db.insert(
    //   'Movie',
    //   newMovie.toJson(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
    var id = newMovie.id;
    var rank = newMovie.rank;
    var title = newMovie.title;
    var fullTitle = newMovie.fullTitle;
    var year = newMovie.year;
    var image = newMovie.year;
    var crew = newMovie.crew;
    var imDbRating = newMovie.imDbRating;
    var imDbRatingCount = newMovie.imDbRatingCount;
    var byteValue = newMovie.imageBytes;

    var raw =   await db.rawInsert('INSERT INTO Movie (id,rank,title,fullTitle,year,image,crew,imDbRating,imDbRatingCount,imageBytes) VALUES(?,?,?,?,?,?,?,?,?,?)',[id, rank,title,fullTitle,year,image,crew,imDbRating,imDbRatingCount, byteValue]);
    print("raw $raw");
    return raw;
  }

  getMovie(int id) async {
    final db = await initializeDBWithMovieData();
    var res =await db.query("Movie", where: "id = ?", whereArgs: [id]);
    print("res    ----- ");
    print(res);
    return res.isNotEmpty ? Movie.fromJson(res.first) : Null ;

  }

  Future<List<Map>> getAllMovies() async {
    final db = await initializeDBWithMovieData();
    var moviesList = await db.query("Movie");
   //  late List<Movie> moviesList = (moviesList?.map((c) => Movie.fromJson(c)).toList() ) as List<Movie>;
    return moviesList;

  }

  Future<String> setImageByteToMovie(int index) async {
    final db = await initializeDBWithMovieData();
    var imageBytesList =  await db.query('Movie', columns: ['imageBytes']);
    var length1 = imageBytesList.length;
    var imageData = imageBytesList[index]["imageBytes"];
    String imageDataString = imageData.toString();
    return imageDataString;

  }

  getSelectedMovie() async {
    final db = await initializeDB();
    var res = await db.rawQuery("SELECT * FROM Movie WHERE selected=1");
    List<Todo> list =
    res.isNotEmpty ? res.map((c) => Todo.fromJson(c)).toList() : [];
    return list;
  }


}