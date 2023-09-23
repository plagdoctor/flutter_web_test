import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_challenge/features/settings/models/setting_config_model.dart';
import 'package:tiktok_challenge/features/settings/repos/setting_config_repos.dart';

class SettingConfigViewModel extends Notifier<SettingConfigModel> {
  final SettingConfigRepository _repository;

  // no more need in riverpod 대신 ConfigModel 을 build return 을 해줘야함
  // late final SettingConfigModel _model =
  //     SettingConfigModel(darkmode: _repository.isDarkMode());

  SettingConfigViewModel(this._repository);

  // no more need in riverpod
  // bool get darkmode => _model.darkmode;

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);

    //혹시 다른 값이 있다면 {속성값}: state.{파라메터}, 로 받아주면 됨
    state = SettingConfigModel(darkmode: value);
  }

  @override
  SettingConfigModel build() {
    // TODO: implement build
    return SettingConfigModel(darkmode: _repository.isDarkMode());
  }
}

final settingConfigProvider =
    NotifierProvider<SettingConfigViewModel, SettingConfigModel>(
        () => throw UnimplementedError());
