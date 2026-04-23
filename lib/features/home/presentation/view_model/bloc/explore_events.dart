sealed class ExploreEvents {}

class GetAllSubjectsEvent extends ExploreEvents {}
class SearchSubjectsEvent extends ExploreEvents {
  final String query;

  SearchSubjectsEvent(this.query);
}