import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SQL_Helper{

  static SQL_Helper sql_helper;
  static Database _database;

  SQL_Helper._createInstant();

  factory SQL_Helper(){ /////////to allow constructor return value write "factory
    if (sql_helper == null)
      sql_helper = SQL_Helper._createInstant();

    return sql_helper;
  }

  final String scoreTable = "score";
  final String _score ="_score";

  final String categoriesTable = "categories";
  final String _catId = "_id";
  final String _catTitle = "_title";
  final String _catDescription = "_description";



  final String tasksTable = "tasks";
  final String _taskId = "_id";
  final String _taskTitle = "_title";
  final String _taskTime = "_time";
  final String _taskDays ="_days";
  final String _taskNotes = "_notes";
  final String _taskAddAlert = "_addAlert";
  final String _taskHardness ="_hardness";
  final String _taskCategory ="_category";
  final String _isCheck ="_isCheck";


  final String taskDaysTable = "days" ;
  final String _dayId = "_dayId";
  final String _dayName = "_dayName";


  final String taskDaysConnectTable = "taskDays" ;
  final String _dayIdd = "_dayId";
  final String _taskIdd = "_dayName";



  Future<Database> get database async {
    if (_database == null)
      _database = await initializedDatabase();
    return _database ;

  }

  Future<Database> initializedDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "project.db";
    var projectDB= await openDatabase(path , version: 2 , onCreate: createDatabase);

    return projectDB;
  }

  void createDatabase (Database db , int version) async{

    String sql0 = "CREATE TABLE $scoreTable($_score INTEGER)";
    await  db.execute(sql0);

    String sql = "CREATE TABLE $categoriesTable($_catId INTEGER PRIMARY KEY AUTOINCREMENT,$_catTitle TEXT,$_catDescription TEXT )";
    await  db.execute(sql);

    String sql2 = "CREATE TABLE $tasksTable($_taskId INTEGER PRIMARY KEY AUTOINCREMENT,$_taskTitle TEXT,$_taskTime TEXT,$_taskNotes TEXT ,$_taskAddAlert INTEGER, $_taskHardness INTEGER,$_taskCategory INTEGER ,$_isCheck INTEGER)";
    await  db.execute(sql2);

    String sql3 = "CREATE TABLE $taskDaysTable($_dayId INTEGER PRIMARY KEY AUTOINCREMENT,$_dayName TEXT)";
    await  db.execute(sql3);

    String sql4 = "CREATE TABLE $taskDaysConnectTable($_dayIdd INTEGER,$_taskIdd INTEGER)";
    await  db.execute(sql4);

  }
  /**//////////  Now Score Queries //////////////////**/

  Future<int> insertScore(Score row) async {

    Database db = await this.database;
    return await db.insert(scoreTable, row.toMap());

  }

  Future<int> updateScore(Score row) async {

    Database db = await sql_helper.database;
    return await db.update(scoreTable, row.toMap());

  }

  Future<int> queryScoresCount() async {
    Database db = await this.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $scoreTable'));
  }


  Future<List<Score>> showScore() async {

    final Database db = await this.database;
    final List<Map<String, dynamic>> maps = await db.query(scoreTable);
    return maps.map((c)=>  Score.fromMap(c)).toList();

  }


/**//////////  Now Category Queries //////////////////**/




  Future<int> insertCategory(Category row) async {

    Database db = await this.database;
    return await db.insert(categoriesTable, row.toMap());

  }


  Future<int> updateCategory(Category row) async {

    Database db = await sql_helper.database;
    int id = row.toMap()[_catId];
    return await db.update(categoriesTable, row.toMap(), where: '$_catId = ?', whereArgs: [id]);

  }


  Future<List<Map<String, dynamic>>> queryAllCategories() async {
    Database db = await this.database;
    String sql = "SELECT * FROM $categoriesTable";
    return await db.rawQuery(sql);
  }


  Future<List<Category>> showCategories() async {

    final Database db = await this.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.map((c)=>  Category.fromMap(c)).toList();

  }



  Future<int> queryCategoriesCount() async {
    Database db = await this.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $categoriesTable'));
  }



  Future<int> deleteCategory(int id) async {
    Database db = await sql_helper.database;
    return await db.delete(categoriesTable, where: '$_catId = ?', whereArgs: [id]);
  }


/**//////////  Now Task Queries //////////////////**/



  Future<int> insertTask(Task row) async {
    Database db = await this.database;
    var result= await db.insert(tasksTable, row.toMap());
    return  result;
  }


  Future<Task> getTask(int taskId) async {
    Database db = await sql_helper.database;
    final List<Map<String, dynamic>> maps= await db.query(tasksTable, where: '$_taskId = ?', whereArgs: [taskId]);
    return maps.map((c)=>  Task.fromMap(c)).toList().first;
  }

  Future<int> updateTask(Task row) async {
    Database db = await sql_helper.database;
    int id = row.toMap()[_taskId];
    return await db.update(tasksTable, row.toMap(), where: '$_taskId = ?', whereArgs: [id]);
  }


  Future<List<Map<String, dynamic>>> queryAllTasks() async {
    Database db = await this.database;
    String sql = "SELECT * FROM $tasksTable";
    return await db.rawQuery(sql);
  }


  Future<List<Task>> showTasks() async {

    final Database db = await this.database;
    final List<Map<String, dynamic>> maps = await db.query(tasksTable);
    return maps.map((c)=>  Task.fromMap(c)).toList();

  }

  Future<List<Task>> showDoneTasks() async {

    final Database db = await this.database;
    final List<Map<String, dynamic>> maps = await db.query(tasksTable,where: '$_isCheck = 1');
    return maps.map((c)=>  Task.fromMap(c)).toList();

  }

  Future<List<Task>>  tasksOfCategory(int catId) async {
    final Database db = await this.database;
    final List<Map<String, dynamic>> maps = await db.query(tasksTable,where: '$_taskCategory = ?', whereArgs: [catId]);
    return  maps.map((c) => Task.fromMap(c)).toList();


  }
  Future<int> queryTasksCount() async {
    Database db = await this.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tasksTable'));
  }
  Future<int> queryTasksCountCatId(int catId) async {
    Database db = await this.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tasksTable where $_taskCategory = $catId'));
  }




  Future<int> deleteTask(int id) async {
    Database db = await sql_helper.database;
    return await db.delete(tasksTable, where: '$_taskId = ?', whereArgs: [id]);
  }


  Future<int> deleteTaskForCat(int CatId) async {
    Database db = await sql_helper.database;
    return await db.delete(tasksTable, where: '$_taskCategory = ?', whereArgs: [CatId]);
  }



}




