class Category {

  int _id;
  String _title;
  String _description = "As you like ^_^";


 bool isPress = false ;

  Category();

  Category.withPar(this._id ,this._title, this._description );
  Category.withTitle(this._title );
  Category.withSomePar(this._id,this._title );




  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }


  String get description => _description;

  set description(String value) {
    _description = value;
  }

//  get tasks => _tasks;
//
//  set tasks(List<Task> value) {
//    _tasks = value;
//  }

  Map<String , dynamic> toMap(){

    var map = Map<String , dynamic>();

    map["_id"]= this._id;
    map["_title"]= this._title;
    map["_description"]= this._description;
   // map["tasks"] =this.tasks;

    return map;

  }

  Category.fromMap( Map<String , dynamic> map){

    this._id =   map["_id"] ;
    this._title =  map["_title"];
    this._description = map["_description"];
   // this.tasks = map["tasks"];
  }



}