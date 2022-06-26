import 'package:app_flutter_remeak/ui/widgets/custom_star_rating.dart';
import 'package:app_flutter_remeak/ui/widgets/dashed_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'beans/data_recipe.dart';

class RecipeItemView extends StatelessWidget {
  final int index;
  final RecipeRows? _recipeRows;

  RecipeItemView(this.index, this._recipeRows);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 8.h),
            decoration: BoxDecoration(
                color: Color(0xffebc789),
                borderRadius: BorderRadius.circular(3.r)),
            child: Padding(
                padding: EdgeInsets.all(3.w), child: Text("No.${index}")),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 8.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: FadeInImage.assetNetwork(
                  width: 100,
                  height: 200,
                  image: _recipeRows?.smallVertical ??
                      "",
                  placeholder: "assets/images/mall.png",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: <InlineSpan>[
                        WidgetSpan(
                            child: Icon(
                              Icons.play_circle_outline,
                              color: Colors.pink,
                              size: 24,
                            )),
                        TextSpan(
                          text: _recipeRows?.recipeName ?? "",
                          style:
                          TextStyle(color: Colors.black, fontSize: 18.sp),
                        ),
                        TextSpan(
                          text: _recipeRows?.createTime ?? "",
                          style: TextStyle(
                              color: Color(0xffa9a9a9), fontSize: 16.sp),
                        )
                      ])),
                      Row(
                        children: [
                          CustomStarRating(
                            starColor: Colors.orange,
                            starBorderColor: Colors.grey,
                            totalRating: 10,
                            rating: 7,
                            starSize: 8.w,
                          )
                        ],
                      ),
                      Text(_recipeRows?.recipeContent ?? "",
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 100.h,
                child: DashedLine(
                  axis: Axis.vertical,
                  dashedWidth: .5.w,
                  dashedHeight: 3.h,
                  count: 20,
                  color: const Color(0xffa9a9a9),
                ),
              ),
              Container(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/wish.png",
                      width: 30.w,
                      height: 30.h,
                    ),
                    Text(
                      "想看",
                      style: TextStyle(fontSize: 12.sp, color: Colors.orange),
                    )
                  ],
                ),
              )
            ]),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
            decoration: const BoxDecoration(color: Color(0xfff2eff2)),
            child: Text(
              _recipeRows?.productName ?? "",
              style: TextStyle(color: const Color(0xff979797), fontSize: 14.sp),
            ),
          )
        ]);
  }
}
