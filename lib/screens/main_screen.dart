import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patriot/cubits/object_cubit.dart';
import 'package:patriot/models/patriot_object/patriot_object.dart';
import 'package:patriot/models/status/status.dart';
import 'package:patriot/widgets/custom_app_bar.dart';
import 'package:patriot/widgets/object_card.dart';
import 'package:patriot/widgets/status_card.dart';

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
          final List<PatriotObject> objectList = (state as ObjectsLoaded).objectList;
          final List<Status> statusList = state.statusList;
          return Column(
            children: [
              const CustomAppBar(text: "Статус охраны"),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: objectList.length + statusList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        if (index < objectList.length)
                          Column(
                            children: [
                              ObjectCard(patriotObject: objectList[index]),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        if (index == objectList.length) ...[
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            width: 335.w,
                            height: 22.h,
                            child: Text(
                              "История статусов",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                height: 21.78 / 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                        if (index >= objectList.length)
                          StatusCard(
                            status: statusList[index],
                            patriotObject: objectList.firstWhere(
                              (element) => statusList[index].objectId == element.id,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
