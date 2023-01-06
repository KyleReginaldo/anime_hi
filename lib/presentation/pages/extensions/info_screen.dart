import 'package:anime_hi/presentation/pages/video_player_screen.dart';
import 'package:anime_hi/presentation/state_management/info/info_bloc.dart';
import 'package:anime_hi/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state is InfoLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        opacity: 0.6,
                        fit: BoxFit.cover,
                        image: NetworkImage(state.info.image),
                      ),
                    ),
                    child: Image.network(state.info.image),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _InfoButton(
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                        title: 'Watch Now',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VideoPlayerScreen(
                                link: state.info.episodes.first.url,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      _InfoButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                        title: 'Add to Watchlist',
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: CustomText(
                      state.info.title,
                      size: 18.sp,
                      weight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: Wrap(
                      children: state.info.genres
                          .map(
                            (e) => Chip(
                              backgroundColor: Theme.of(context).primaryColor,
                              label: CustomText(
                                e,
                                color: Colors.white,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: ReadMoreText(
                      state.info.description,
                      trimLines: 4,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                      colorClickableText: Theme.of(context).primaryColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is InfoLoading) {
            return const LinearProgressIndicator();
          } else if (state is InfoError) {
            return Center(
              child: CustomText(
                state.message,
                size: 24.sp,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  const _InfoButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            CustomText(
              title,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
