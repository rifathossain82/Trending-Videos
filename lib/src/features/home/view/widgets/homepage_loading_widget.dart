import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/k_shimmer_container.dart';

class HomepageLoadingWidget extends StatelessWidget {
  const HomepageLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      itemCount: 15,
      itemBuilder: (context, index) => const _VideoShimmerItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class _VideoShimmerItem extends StatelessWidget {
  const _VideoShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        children: [
          /// Thumbnail Shimmer
          const Expanded(
            child: KShimmerContainer(),
          ),

          /// Footer Content Shimmer.
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KShimmerContainer(
                  height: 40,
                  width: 40,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                KShimmerContainer(
                                  height: 20,
                                ),
                                SizedBox(height: 4),
                                KShimmerContainer(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 11),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {},
                            child: Icon(
                              Icons.more_vert,
                              color: kGreyMedium,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      KShimmerContainer(
                        height: 20,
                        width: context.screenWidth * 0.4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
