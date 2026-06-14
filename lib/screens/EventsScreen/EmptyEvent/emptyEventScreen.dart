import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../DetailsEventScreen/detailsEventScreen.dart';


class EmptyEventsScreen extends StatelessWidget {
  const EmptyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.appBGColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBGColor,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Events',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            // height for tabBar from AppBar
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 9,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab, // The size of the selected tab indicator
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.grayColor,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'UPCOMING'),
                    Tab(text: 'PAST EVENTS'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [

            _EmptyStateBody(),

            _EmptyStateBody(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: PrimaryButton(
              label: 'EXPLORE EVENTS',
              onTap: () {
               Navigator.pushNamed(context, AppRoutes.allEventsScreen);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyStateBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.noUpComingEventsImage,
            width: 180,
            height: 180,
          ),
          const SizedBox(height: 24),
          const Text(
            'No Upcoming Event',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lorem ipsum dolor sit amet,\nconsectetur',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}