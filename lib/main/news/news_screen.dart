import 'package:coinz/constants/colors.dart';
import 'package:coinz/widgets/outlined_container.dart';
import 'package:flutter/material.dart';
import 'package:coinz/constants/styles.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 26.w, right: 26.w, top: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _headerBuilder(),
              _newsListBuilder(),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                  child: Text(
                    'جاري تحميل المزيد',
                    style: TextStyle(
                      color: highlightTextColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView _newsListBuilder() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return OutlinedContainer(
          height: 94.h,
          width: 123.w,
          padding: EdgeInsets.all(8.w),
          borderRadius: BorderRadius.circular(15.r),
          outlineColor: const Color(0xFFEAEAEA),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'انتعاش في قيمة العملات الرقمية الرئيسية تمثلت بارتفاع كل من البيتكوين والاثيريوم وكاردانو',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Swissra',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox(height: 1)),
              Text(
                '12/22/2018',
                style: TextStyle(
                  fontSize: 8.sp,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 10.h),
    );
  }

  Widget _headerBuilder() {
    return const Text(
      'أخبار و تقارير',
      textAlign: TextAlign.start,
      style: headingStyle,
    );
  }
}
