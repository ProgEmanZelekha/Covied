import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/generated/l10n.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..homeInitial(),
      child: Builder(builder: (context) {
        return _buildPage(context);
      }),
    );
  }


  Widget _buildPage(BuildContext context) {
    late TabsRouter tabsRouter;

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ChangeActive) {
          tabsRouter.setActiveIndex(state.active);
        }
      },
      child: Container(
        color: AppColors.current.primaryColor,
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: AutoTabsRouter(
            routes: [HomeRoute(), EmptyTestRoute(), ProfileRoute()],
            builder: (context, child, animation) {
              tabsRouter = AutoTabsRouter.of(context);
              return Scaffold(
                  body: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  bottomNavigationBar: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.w),
                          topLeft: Radius.circular(30.w)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0,
                            blurRadius: 5.w),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.w),
                        topRight: Radius.circular(30.w),
                      ),
                      child: BottomNavigationBar(
                        showUnselectedLabels: false,
                        currentIndex: tabsRouter.activeIndex,
                        onTap: (index) {
                          tabsRouter.setActiveIndex(index);
                        },
                        selectedItemColor: AppColors.current.secondaryColor,
                        unselectedItemColor: AppColors.current.primaryTextColor,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(
                              Assets.images.home,
                              height: 24.w,
                              width: 24.w,
                              color: AppColors.current.secondaryColor,
                            ),
                            icon: SvgPicture.asset(Assets.images.home,
                                height: 24.w,
                                width: 24.w,
                                color: AppColors.current.primaryTextColor),
                            label: S.current.home,
                          ),
                          BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(
                              Assets.images.test,
                              height: 24.w,
                              width: 24.w,
                              color: AppColors.current.secondaryColor,
                            ),
                            icon: SvgPicture.asset(Assets.images.test,
                                height: 24.w,
                                width: 24.w,
                                color: AppColors.current.primaryTextColor),
                            label: S.current.test,
                          ),
                          BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(Assets.images.profile,
                                height: 24.w,
                                width: 24.w,
                                color: AppColors.current.secondaryColor),
                            icon: SvgPicture.asset(Assets.images.profile,
                                height: 24.w,
                                width: 24.w,
                                color: AppColors.current.primaryTextColor),
                            label: S.current.profile,
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
