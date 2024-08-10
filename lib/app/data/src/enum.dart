// ignore_for_file: constant_identifier_names

enum OrderType {
  all,
  unpaid,
  ready_to_process,
  processed,
  shipped,
  ready_to_pick,
  received,
  completed,
  cancelled
}

enum Method { mutate, query }

enum MethodDio { POST, GET, DELETE, PUT }

enum StatsVisits { etalase, product, supplier }

enum StepStats { done, ready, none }

enum OtpMethod { wa, sms }
