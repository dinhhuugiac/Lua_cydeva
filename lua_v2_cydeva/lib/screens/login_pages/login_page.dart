import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lua_v2_cydeva/conponents/colors.dart';
import 'package:lua_v2_cydeva/screens/registers/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool languageSelected = false;
  String selectedLanguage = ' ';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {}
    });
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      UserCredential userCredential =
          await _auth.signInWithProvider(googleAuthProvider);
      await FirebaseAuth.instance.signOut();

      User? user = userCredential.user;
      if (user != null) {
        String? userEmail = user.email;
        print('email: $userEmail');
        String? idToken = await user.getIdToken();
        print('token :  $idToken');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(emailUser: userEmail),
          ),
        );
      } else {
        await FirebaseAuth.instance.signOut();
        print('sign out');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 16,
                                          bottom: 35),
                                      child: SizedBox(
                                        height: 328,
                                        child: Column(
                                          children: [
                                            const Center(
                                              child: Text(
                                                'Select language',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedLanguage =
                                                      'vietnamese';
                                                  languageSelected = true;
                                                });
                                              },
                                              child: SizedBox(
                                                height: 56,
                                                width: 382,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/icon holder.svg',
                                                            width: 36,
                                                            height: 24,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            'Vietnamese',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xfff2d3748),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Radio(
                                                      activeColor: const Color(
                                                          0xfff67a800),
                                                      value: 'vietnamese',
                                                      groupValue:
                                                          selectedLanguage,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedLanguage =
                                                              value.toString();
                                                          languageSelected =
                                                              true;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 382,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedLanguage =
                                                        'english';
                                                    languageSelected = true;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/United Kingdom.svg',
                                                            width: 36,
                                                            height: 24,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            'English',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xfff2d3748),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Radio(
                                                      activeColor: const Color(
                                                          0xfff67a800),
                                                      value: 'english',
                                                      groupValue:
                                                          selectedLanguage,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedLanguage =
                                                              value.toString();
                                                          languageSelected =
                                                              true;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 130,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (languageSelected) {
                                                  Navigator.pop(context);
                                                }
                                              },
                                              style: TextButton.styleFrom(
                                                minimumSize:
                                                    const Size(390, 56),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                backgroundColor:
                                                    ColorsApp.backGroundColor,
                                              ),
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/icon holder.svg',
                            width: 36,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Chào mừng đến với LUA',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF)),
                  ),
                  const SizedBox(
                    height: 502,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(378, 59),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        backgroundColor: const Color(0xFFFFFFFF),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset('assets/icons/apple.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Đăng nhập với Google',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfff1a202c)),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(378, 59),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        backgroundColor: const Color(0xFFFFFFFF),
                      ),
                      onPressed: () {
                        _handleGoogleSignIn();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const RegisterPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset('assets/icons/google.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Đăng nhập với Google',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfff1a202c)),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
