import 'package:hr_army/model/user.dart';

class Event {
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<UserEvent> participants = [];
  late String id;

  Event(this.name, this.description, this.startDate, this.endDate) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }

  void addParticipant(User user, String startDate) {
    participants.add(UserEvent(user, startDate));
  }

  @override
  String toString() {
    return "Event: {name: $name, description: $description, startDate: $startDate, endDate: $endDate, participants: $participants}";
  }
}
