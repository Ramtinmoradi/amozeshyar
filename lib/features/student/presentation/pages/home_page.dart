import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/routes/page_route.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        title: CustomText(
          data: 'صفحه اصلی',
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.eight),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, profilePage);
              },
              child: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSize.sixteen),
          child: Wrap(
            spacing: AppSize.sixteen,
            runSpacing: AppSize.sixteen,
            children: [
              HomeItem(
                icon: Icons.add_box_rounded,
                title: 'انتخاب واحد',
                onTap: () {
                  Navigator.pushNamed(context, unitSelectionPage);
                },
              ),
              HomeItem(
                icon: Icons.screen_search_desktop_rounded,
                title: 'جستجو درس',
                onTap: () {
                  Navigator.pushNamed(context, searchUnitPage);
                },
              ),
              HomeItem(
                icon: Icons.view_list_rounded,
                title: 'وضعیت نیمسال',
                onTap: () {
                  Navigator.pushNamed(context, semesterStatusPage);
                },
              ),
              HomeItem(
                icon: Icons.list_alt_rounded,
                title: 'کارنامه نیمسال',
                onTap: () {
                  Navigator.pushNamed(context, semesterReportPage);
                },
              ),
              HomeItem(
                icon: Icons.attach_money_rounded,
                title: 'وضعیت مالی',
                onTap: () {
                  Navigator.pushNamed(context, financialSituationPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      width: AppSize.setFullSizeWidth * 0.28,
      height: AppSize.setFullSizeWidth * 0.28,
      padding: EdgeInsets.zero,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: AppSize.eight),
            CustomText(
              data: title,
              fontSize: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
