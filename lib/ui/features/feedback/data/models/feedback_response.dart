class FeedbackResponse {
  String status;

  static FeedbackResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FeedbackResponse forecastResponseBean = FeedbackResponse();
    forecastResponseBean.status = map['result'].toString();
    return forecastResponseBean;
  }

  Map toJson() => {
        "result": status,
      };
}
