import 'package:clean_architecture/domain/exceptions/validation_exception.dart';

class User {
  int id;
  String name;
  String username;

  //Typically called form service layer to create a new user
  User({this.id, this.name, this.username});

  //Typically called from the data_source layer after getting data from an external source.
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  //Typically called from service or data_source layer just before persisting data.
  //Here is the appropriate place to check data validity before persistence.
  Map<String, dynamic> toJson() {
    //validate
    _validation();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }

  _validation() {
    if (name == null) {
      throw ValidationException('You can not persist null name');
    }
  }
}
