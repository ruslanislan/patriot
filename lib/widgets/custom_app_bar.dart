import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 116.h,
      child: Stack(
        children: [
          if (onTap != null)
            Positioned(
              top: 32.h,
              left: 16.w,
              child: GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  width: 21.w,
                  height: 21.h,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 69.h,
            left: 16.w,
            child: SizedBox(
              width: 243.w,
              height: 41.h,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  height: 41 / 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
