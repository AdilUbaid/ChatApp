import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  final void Function(String query) onChanged;

  const SearchBox({Key? key, required this.onChanged}) : super(key: key);

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
              borderRadius: BorderRadius.circular(30),
            ),
            width: 350,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
