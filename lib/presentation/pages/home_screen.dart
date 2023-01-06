import 'package:anime_hi/presentation/pages/extensions/info_screen.dart';
import 'package:anime_hi/presentation/state_management/top_airing/top_airing_bloc.dart';
import 'package:anime_hi/presentation/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../dependency.dart';
import '../state_management/info/info_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TopAiringBloc>().add(FetchTopAiringAnimeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          'AnimeHi',
          size: 18.sp,
          weight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<TopAiringBloc, TopAiringState>(
            builder: (context, state) {
              if (state is TopAiringLoaded) {
                return CarouselSlider(
                  items: state.anime.results.map((e) {
                    return Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: e.image,
                          width: 100.w,
                          height: 30.h,
                          fit: BoxFit.cover,
                          color: Colors.black45,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Positioned(
                          bottom: 10.h,
                          left: 2.h,
                          child: SizedBox(
                            width: 90.w,
                            child: CustomText(
                              e.title,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              size: 16.sp,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3.h,
                          left: 2.h,
                          child: Row(
                            children: [
                              _CarouselButon(
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                ),
                                title: 'Play',
                                onTap: () {
                                  print('Play');
                                },
                              ),
                              SizedBox(width: 2.w),
                              _CarouselButon(
                                icon: const Icon(
                                  Icons.read_more_rounded,
                                  color: Colors.white,
                                ),
                                title: 'Read More',
                                onTap: () {
                                  print('Read More');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider(
                                        create: (context) => sl<InfoBloc>()
                                          ..add(FetchAnimeInfoEvent(id: e.id)),
                                        child: const InfoScreen(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 30.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class _CarouselButon extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  const _CarouselButon({
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
