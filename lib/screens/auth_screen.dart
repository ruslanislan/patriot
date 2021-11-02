import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patriot/cubits/object_cubit.dart';
import 'package:patriot/screens/main_screen.dart';
import 'package:patriot/services/auth_service.dart';
import 'package:patriot/widgets/custom_app_bar.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController(text: "maksimeditor@yandex.ru");
  final TextEditingController passwordController = TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: "Вход",
              onTap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 375.w,
              height: 56.h,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: TextField(
                controller: emailController,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  height: 18.15 / 15,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    height: 18.15 / 15,
                    color: const Color(0xFF797979),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 375.w,
              height: 56.h,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  height: 18.15 / 15,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "Пароль",
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    height: 18.15 / 15,
                    color: const Color(0xFF797979),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 53.h,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  final bool login = await _authService.login(emailController.text, passwordController.text);
                  if (login) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => ObjectCubit()..loadData(),
                          child: const MainScreen(),
                        ),
                      ),
                    );
                  }
                } catch (ex) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        ex.toString(),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: 335.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: const Color(0xFF305E39),
                ),
                child: Center(
                  child: Text(
                    "Продолжить",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 19.36 / 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Container(
              width: 375.w,
              height: 18.h,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                    height: 16.h,
                    child: const Icon(
                      Icons.vpn_key_rounded,
                      color: Color(0xFF62AD6F),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 122.w,
                    child: Text(
                      "Забыли пароль?",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        height: 18.15 / 15,
                        color: const Color(0xFF62AD6F),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
