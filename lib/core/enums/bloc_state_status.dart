enum BlocStateStatus { initial, loadInProgress, loadSuccess, loadFailure }

final blocStateStatusValues = EnumValues({
  "initial": BlocStateStatus.initial,
  "loadInProgress": BlocStateStatus.loadInProgress,
  "loadSuccess": BlocStateStatus.loadSuccess,
  "loadFailure": BlocStateStatus.loadFailure,
});

class EnumValues<T> {
  late Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
