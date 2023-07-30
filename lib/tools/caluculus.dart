class Calculator {
  calculateAvg(List<dynamic> values) {
    double avg = 0;
    int sum = 0;

    for (int element in values) {
      sum += element;

      avg = sum / values.length;
    }

    return avg;
  }

  maxvalue(List values) {
    int max =
        values.reduce((curr, next) => curr > next ? curr : next); // 8 --> Max
    return max;
  }

  minvalue(List values) {
    int min =
        values.reduce((curr, next) => curr < next ? curr : next); // 8 --> Max
    return min;
  }

  calculateAvgm(List<dynamic> values) {
    double avg = 0;
    var sum = 0.0;

    for (var element in values) {
      sum += element;

      avg = sum / values.length;
    }

    return avg;
  }

  maxvaluem(List values) {
    var max =
        values.reduce((curr, next) => curr > next ? curr : next); // 8 --> Max
    return max;
  }

  minvaluem(List values) {
    var min =
        values.reduce((curr, next) => curr < next ? curr : next); // 8 --> Max
    return min;
  }
}
