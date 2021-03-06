/* code partly inspired by
       - https://www.youtube.com/watch?v=t39VV2XyqR0&list=PLDQl6gZtjvFu5l20K5KTEBLCjfRjHowLj&index=6
*/

/// model class for user-object

class User {
  int _id;
  String _name;
  String _password;
  int _counter;

  /// constructor [User]
  User(this._name, this._password, this._counter);

  /// named constructor
  User.withID(this._name, this._password, this._counter);

  /// getters
  int get id => _id;
  String get name => _name;
  String get password => _password;
  int get counter => _counter;

  /// setters
  set name(String newName) {this._name = newName;}
  set password(String newPW) {this._password = newPW;}
  set counter(int newCounter) {
    if (newCounter >= 1 && newCounter <= 2) {
      this._counter = newCounter;
    }
  }

  /// converts a user-object into a map-object
  Map<String, dynamic> toMap() {
    //map['id'] etc are all Strings ('id', 'title', 'description'...) but on the right as a value we have Strings and ints => therefore we use dynamic.
    //if we would only have values of type int, we could define the Map as "Map<String, int> to Map()"
    var map = Map<String, dynamic>();     //instanciate map object

    map['id'] = _id;
    if (_id != null) { // check if id is null or not, depending on if it is used for insert or update
      map['id'] = _id;
    }
    map['name'] = _name;
    map['password'] = _password;
    map['counter'] = _counter;

    return map;
  }

  /// extracts a user-object from a map-object
  User.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._password = map['password'];
    this._counter = map['counter'];
  }
}
