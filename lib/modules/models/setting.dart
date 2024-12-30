class Setting {
  bool is24Hour;
  bool showMinute;

  Setting({required this.is24Hour, required this.showMinute});

  Setting copyWith({bool? is24Hour, bool? showMinute}) {
    return Setting(is24Hour: is24Hour ?? this.is24Hour, showMinute: showMinute ?? this.showMinute);
  }
}