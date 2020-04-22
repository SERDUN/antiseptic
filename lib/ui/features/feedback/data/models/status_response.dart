class StatusResponse {
  String status;

  static StatusResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StatusResponse forecastResponseBean = StatusResponse();
    forecastResponseBean.status = map['result'].toString();
    return forecastResponseBean;
  }

  Map toJson() => {
        "result": status,
      };
}
