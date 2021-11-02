import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patriot/cubits/object_cubit.dart';
import 'package:patriot/models/patriot_object/patriot_object.dart';
import 'package:patriot/widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ObjectCubit, ObjectState>(
        builder: (context, state) {
          if (state is ObjectsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ObjectsError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          final List<PatriotObject> list = (state as ObjectsLoaded).list;
          return Column(
            children: [
              const CustomAppBar(text: "Статус охраны"),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 335.w,
                    height: 155.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: const Color(0xFF499356),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 98.w,
                          height: 12.h,
                          child: Text(
                            list[index].list![0].eventDate.toString(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.21,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Text(
                          list[index].list![0].eventName!,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF62AD6F),
                            height: 18.15 / 15,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          list[index].list![0].eventDescription!,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 15.73 / 13,
                          ),
                        ),
                        SizedBox(
                          height: 6.5.h,
                        ),
                        Divider(
                          height: 27.h,
                        ),
                        Text(
                          list[index].address!,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 15.73 / 13,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
