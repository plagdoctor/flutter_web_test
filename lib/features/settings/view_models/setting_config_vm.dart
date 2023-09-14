import 'package:flutter/material.dart';
import 'package:tiktok_challenge/features/settings/models/setting_config_model.dart';
import 'package:tiktok_challenge/features/settings/repos/setting_config_repos.dart';

class SettingConfigViewModel extends ChangeNotifier {
  final SettingConfigRepository _repository;

  late final SettingConfigModel _model =
      SettingConfigModel(darkmode: _repository.isDarkMode());

  SettingConfigViewModel(this._repository);

  bool get darkmode => _model.darkmode;

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    _model.darkmode = value;
    notifyListeners();
  }
}
