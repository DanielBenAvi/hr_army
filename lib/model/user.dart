class User {
  final String _id;
  final String _firstName;
  final String _lastName;
  final String _email;
  final String _phone;
  final String _battalion; // גדוד
  final String _company; // פלוגה
  final String _platoon; // מחלקה
  final String _class; // כיתה
  final String _role; // תפקיד

  User(this._id, this._firstName, this._lastName, this._email, this._phone,
      this._battalion, this._company, this._platoon, this._class, this._role);

  @override
  String toString() {
    return "User: {id: $_id, firstName: $_firstName, lastName: $_lastName, email: $_email, phone: $_phone, battalion: $_battalion, company: $_company, platoon: $_platoon, class: $_class, role: $_role}";
  }

  String get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phone => _phone;
  String get battalion => _battalion;
  String get company => _company;
  String get platoon => _platoon;
  String get class_ => _class;
  String get role => _role;
}

class UserEvent {
  final String _id;
  final User _user;
  final String _startDate;

  UserEvent(this._user, this._startDate) : _id = _user._id;

  @override
  String toString() {
    return "UserEvent: {id: $_id, user: $_user, startDate: $_startDate}";
  }
}
