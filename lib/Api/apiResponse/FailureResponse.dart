
class FailureResponse {
  String? error;

  FailureResponse({this.error});

  FailureResponse.fromJson(Map<String, dynamic> json) {
    if(json['error']!=null)
      error = json['error'];
    else if (json['Error']!=null)
      error = json['Error'];
    else {
      error  = findErrors(json);
    }
  }
  String findErrors(Map<String, dynamic> json) {
    final List<String> errors = [];

    void searchErrors(Map<dynamic, dynamic> map) {
      map.forEach((key, value) {
        if (key.toLowerCase().contains('value')) {
          errors.add('$key: $value');
        }
        if (value is Map) {
          searchErrors(value);
        } else if (value is List) {
          for (var item in value) {
            if (item is Map) {
              searchErrors(item);
            }
          }
        }
      });
    }

    searchErrors(json);
    return errors.join(",");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}