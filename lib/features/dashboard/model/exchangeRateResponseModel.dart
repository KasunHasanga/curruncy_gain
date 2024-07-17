class ExchangeRateResponseModel {
    String? date;
    String? historical;
    Info? info;
    Query? query;
    double? result;
    bool? success;

    ExchangeRateResponseModel(
        {this.date,
            this.historical,
            this.info,
            this.query,
            this.result,
            this.success});

    ExchangeRateResponseModel.fromJson(Map<String, dynamic> json) {
        date = json['date'];
        historical = json['historical'];
        info = json['info'] != null ? Info.fromJson(json['info']) : null;
        query = json['query'] != null ? Query.fromJson(json['query']) : null;
        result = json['result'];
        success = json['success'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['date'] = date;
        data['historical'] = historical;
        if (info != null) {
            data['info'] = info!.toJson();
        }
        if (query != null) {
            data['query'] = query!.toJson();
        }
        data['result'] = result;
        data['success'] = success;
        return data;
    }
}

class Info {
    double? rate;
    int? timestamp;

    Info({this.rate, this.timestamp});

    Info.fromJson(Map<String, dynamic> json) {
        rate = json['rate'];
        timestamp = json['timestamp'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['rate'] = rate;
        data['timestamp'] = timestamp;
        return data;
    }
}

class Query {
    int? amount;
    String? from;
    String? to;

    Query({this.amount, this.from, this.to});

    Query.fromJson(Map<String, dynamic> json) {
        amount = json['amount'];
        from = json['from'];
        to = json['to'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['amount'] = amount;
        data['from'] = from;
        data['to'] = to;
        return data;
    }
}