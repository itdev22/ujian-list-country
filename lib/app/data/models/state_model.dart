class StateModelResponse {
  List<StateModel>? data;

  StateModelResponse({this.data});

  StateModelResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StateModel>[];
      json['data'].forEach((v) {
        data!.add(new StateModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateModel {
  String? iDState;
  String? state;
  int? iDYear;
  String? year;
  int? population;
  String? slugState;

  StateModel(
      {this.iDState,
      this.state,
      this.iDYear,
      this.year,
      this.population,
      this.slugState});

  StateModel.fromJson(Map<String, dynamic> json) {
    iDState = json['ID State'];
    state = json['State'];
    iDYear = json['ID Year'];
    year = json['Year'];
    population = json['Population'];
    slugState = json['Slug State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID State'] = this.iDState;
    data['State'] = this.state;
    data['ID Year'] = this.iDYear;
    data['Year'] = this.year;
    data['Population'] = this.population;
    data['Slug State'] = this.slugState;
    return data;
  }
}
