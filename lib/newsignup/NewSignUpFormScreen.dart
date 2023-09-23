import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/main_navigation/Main_navigation_screen.dart';
import 'package:tiktok_challenge/newsignup/view_models/signup_vm.dart';
import 'package:tiktok_challenge/ui/AuthButton.dart';
import 'package:tiktok_challenge/util/utils.dart';

class NewSignUpForThreadScreen extends ConsumerStatefulWidget {
  static const routeURL = "/";
  static const routeName = "/";
  const NewSignUpForThreadScreen({super.key});

  @override
  ConsumerState<NewSignUpForThreadScreen> createState() =>
      _NewSignUpForThreadScreenState();
}

class _NewSignUpForThreadScreenState
    extends ConsumerState<NewSignUpForThreadScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  String _email = "";

  String _password = "";

  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });

    // _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isEmailValid() {
    if (_email.isEmpty) return false;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return false;
    }
    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit(BuildContext context) async {
    if (_email.isEmpty || !_isEmailValid()) return;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // print('Email: $_email');

      ref.read(signUpForm.notifier).state = {
        "email": _email,
        "password": _password
      };

      ref.read(signUpProvider.notifier).signUp();

      final retValue = await Navigator.of(context).push<bool>(MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(
                tab: "home",
              )));
      print('retValue: $retValue');

      setState(() {
        switchValue = retValue!;
      });
    }
  }

  // void _toFinish(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v48,
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      height: 40,
                      'assets/icons/Inlined_logo.svg',
                      color: isDarkMode(context) ? null : Colors.black45,
                    ),
                    iconSize: 2,
                  ),
                ),
                Gaps.v40,
                const Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v36,
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['email'] = newValue;
                    }
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onEditingComplete: () => _onSubmit(context),
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size20,
                          color: _isEmailValid() ? Colors.green : Colors.white,
                        ),
                      ],
                    ),
                    // hintText: "Email",
                    // errorText: _isEmailValid(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v32,
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['password'] = newValue;
                    }
                  },
                  controller: _passwordController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size20,
                          color:
                              _isPasswordValid() ? Colors.green : Colors.white,
                        ),
                      ],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v40,
                GestureDetector(
                  onTap: () => _onSubmit(context),
                  child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                    text: "Sign up",
                    isDark: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
