import 'package:hr_army/model/user.dart';

class Event {
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final List<UserEvent> participants = [];

  Event(this.name, this.description, this.startDate, this.endDate);

  void addParticipant(User user, String startDate) {
    participants.add(UserEvent(user, startDate));
  }

  @override
  String toString() {
    return "Event: {name: $name, description: $description, startDate: $startDate, endDate: $endDate, participants: $participants}";
  }
}
