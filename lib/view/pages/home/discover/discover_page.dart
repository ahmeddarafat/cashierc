import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../data/dummy_data/dummy_data.dart';
import '../../../../data/models/category_model.dart';
import '../../../../resources/constants/app_assets.dart';
import '../../../../resources/constants/app_constants.dart';
import '../../../../resources/extensions/app_extensions.dart';
import '../../../../resources/router/app_router.dart';
import '../../../widgets/public_text.dart';
import '../../../widgets/public_title_tile.dart';
import '../../../../view_model/home/home_cubit.dart';

import '../../../../../resources/localization/generated/l10n.dart';
import '../../../../../resources/styles/app_colors.dart';
import '../../../widgets/item_card.dart';

part 'components/category_item.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = HomeCubit.getInstance(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView(
            children: [
              20.ph,
              Row(
                children: [
                  PublicText(
                    txt: S.of(context).WelcomeBack,
                    size: 20.sp,
                    fw: FontWeight.w600,
                    letterSpacing: 2.8.h,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.notifications);
                    },
                    icon: SvgPicture.asset(
                      Assets.iconsNotification,
                      height: 30.w,
                      width: 30.w,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              20.ph,

              /// search
              InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.categories),
                child: Hero(
                  tag: "Search tage",
                  child: Container(
                    width: double.infinity,
                    height: 40.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        10.pw,
                        PublicText(
                          txt: S.of(context).search,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              20.ph,

              /// Banner
              Image.asset(
                Assets.imagesBanner,
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              /// categories
              PublicTitleTile(
                title: S.of(context).categories,
                seeAllOnTap: () {
                  Navigator.pushNamed(context, AppRoutes.categories);
                },
              ),
              20.ph,
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.categories.length,
                  separatorBuilder: (_, __) => 20.pw,
                  itemBuilder: (_, index) {
                    return CategoryItem(
                      category: AppConstants.categories[index],
                    );
                  },
                ),
              ),

              /// Best Seller
              PublicTitleTile(
                title: S.of(context).bestSeller,
                seeAllOnTap: () {
                  Navigator.pushNamed(context, AppRoutes.bestSeller);
                },
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DummyData.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 170 / 220,
                ),
                itemBuilder: (_, index) {
                  return ItemCard(item: bloc.allItems[index]);
                },
              ),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}
