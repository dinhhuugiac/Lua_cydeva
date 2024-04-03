import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v2_cydeva/conponents/colors.dart';
import 'package:lua_v2_cydeva/screens/topics/topic_page.dart';

class RegisterPage extends StatefulWidget {
  final String? emailUser;
  const RegisterPage({Key? key, this.emailUser = ''}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isPhoneNumberValid(String phoneNumber) {
    if (phoneNumber.isEmpty || phoneNumber.length != 10) {
      return false;
    }
    return true;
  }

  bool _isPhoneNumberValidSecond(String phoneNumber) {
    if (phoneNumber.isEmpty ||
        phoneNumber[0] != '0' ||
        phoneNumber.length != 10) {
      return false;
    }
    return true;
  }

  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              'Thông tin cá nhân ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: SizedBox(
                      height: 98,
                      width: 98,
                      child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              const AssetImage('assets/images/avatar.png'),
                          child: Align(
                              heightFactor: 40,
                              widthFactor: 40,
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                  'assets/icons/camera.svg')))),
                ),
                const SizedBox(
                  height: 42,
                ),
                Container(
                  child: Stack(
                    children: [
                      const Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Nhập họ và tên',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfffa0aec0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfffa0aec0))),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          color: Colors.white,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Họ và tên ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          TextField(
                            controller:
                                TextEditingController(text: selectedGender),
                            decoration: const InputDecoration(
                              hintText: 'Chọn giới tính',
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffa0aec0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfffa0aec0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 16,
                        top: 10,
                        child: Container(
                          child: DropdownButton<String>(
                            onChanged: (String? value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            underline: Container(),
                            items: <String>['Nam', 'Nữ', 'Khác']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      color: value == selectedGender
                                          ? const Color.fromARGB(
                                                  255, 196, 200, 204)
                                              .withOpacity(0.5)
                                          : null),
                                  child: Center(
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          color: Colors.white,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Giới tính',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 32,
                ),
                /////Sdt
                ///
                Container(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          TextField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                                hintText: 'Nhập số điện thoại',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfffa0aec0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfffa0aec0))),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          color: Colors.white,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Số điện thoại ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                /////Địa chỉ
                Container(
                  child: Stack(
                    children: [
                      const Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Nhập địa chỉ của bạn',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfffa0aec0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfffa0aec0))),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          color: Colors.white,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Đại chỉ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ////email
                Container(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          TextField(
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffa0aec0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfffa0aec0),
                              ),
                            ),
                            controller:
                                TextEditingController(text: widget.emailUser),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          color: Colors.white,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Email',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                    onPressed: () {
                      String phoneNumber = _phoneNumberController.text.trim();
                      if (_isPhoneNumberValid(phoneNumber) &&
                          _isPhoneNumberValidSecond(phoneNumber)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopicPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please enter a valid phone number starting with 0 and has 10 number.'),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size(390, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: _isPhoneNumberValid(
                                    _phoneNumberController.text.trim()) ||
                                _isPhoneNumberValidSecond(
                                    _phoneNumberController.text.trim())
                            ? ColorsApp.backGroundColor
                            : ColorsApp.backGroundColor.withOpacity(0.5)),
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
