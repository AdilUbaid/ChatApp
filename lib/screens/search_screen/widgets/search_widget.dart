import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.h, top: 10.h),
      child: Row(
        children: [
          Container(
              height: 70.h,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30)),
              // color: Colors.amber,
              width: 350,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Search"),
                ),
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
