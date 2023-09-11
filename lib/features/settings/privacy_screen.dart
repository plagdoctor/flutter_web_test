import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: false,
            onChanged: (value) => {},
            title: const Text("Private profile"),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.person),
            title: const Text("Mentions"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Everyone",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: Sizes.size16,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    // 여기에 애로우 아이콘을 눌렀을 때 실행할 코드를 넣습니다.
                  },
                )
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.bellSlash),
            title: const Text("Muted"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    // 여기에 애로우 아이콘을 눌렀을 때 실행할 코드를 넣습니다.
                  },
                )
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.eyeSlash),
            title: const Text("Hidden Words"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    // 여기에 애로우 아이콘을 눌렀을 때 실행할 코드를 넣습니다.
                  },
                )
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.peopleGroup),
            title: const Text("Hidden Words"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    // 여기에 애로우 아이콘을 눌렀을 때 실행할 코드를 넣습니다.
                  },
                )
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("Other privacy seetings"),
            subtitle: const Text(
              "Some Settings, like restrict, apply to both Threads and Instagram and can be managed on instagram.",
              style: TextStyle(
                color: Colors.black54,
                fontSize: Sizes.size14,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.outbound_rounded),
                  onPressed: () {
                    // 여기에 애로우 아이콘을 눌렀을 때 실행할 코드를 넣습니다.
                  },
                )
              ],
            ),
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
