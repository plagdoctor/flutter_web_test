import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_challenge/features/settings/privacy_screen.dart';
import 'package:tiktok_challenge/features/settings/view_models/setting_config_vm.dart';

class SettingScreen extends ConsumerWidget {
  static String routeName = "/settings";
  static const routeURL = "/settings";
  const SettingScreen({super.key});

  void _onNextPage(BuildContext context) {
    context.push(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: ref.watch(settingConfigProvider).darkmode,
            // context.watch<SettingConfigViewModel>().darkmode,
            onChanged: (value) =>
                {ref.read(settingConfigProvider.notifier).setDarkMode(value)},
            //     context.read<SettingConfigViewModel>().setDarkMode(value),
            title: const Text("dark mode"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.person),
            title: Text('Follow and invite friends'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.bell),
            title: Text('Notifications'),
          ),
          GestureDetector(
            onTap: () => _onNextPage(context),
            child: const ListTile(
              leading: FaIcon(FontAwesomeIcons.lock),
              title: Text('Privacy'),
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.personCircleCheck),
            title: Text('Account'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.hotTubPerson),
            title: Text('Help'),
          ),
          ListTile(
            title: const Text("Log out"),
            textColor: Colors.blue,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {},
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(FontAwesomeIcons.skull),
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please dooooont gooooo"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Not log out"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes plz."),
                    )
                  ],
                ),
              );
            },
          ),
          const AboutListTile(
            applicationVersion: "1.0",
            applicationLegalese: "Don't copy me.",
          ),
        ],
      ),
    );
  }
}
