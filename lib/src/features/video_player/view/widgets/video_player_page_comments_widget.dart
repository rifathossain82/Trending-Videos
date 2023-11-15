import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/core/utils/asset_path.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/cached_network_image_builder.dart';
import 'package:trending_videos/src/features/comments/view/pages/comments_page.dart';
import 'package:trending_videos/src/features/video_player/cubit/video_player_cubit.dart';

class VideoPlayerPageCommentsWidget extends StatelessWidget {
  const VideoPlayerPageCommentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 15),
        _TotalCommentTextWidget(),
        SizedBox(height: 8),
        _CommentBoxWidget(),
        SizedBox(height: 16),
        _CommentListWidget(),
        SizedBox(height: 15),
      ],
    );
  }
}

class _TotalCommentTextWidget extends StatelessWidget {
  const _TotalCommentTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Comments   7.5K',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kGreyTextColor,
            ),
          ),
          SvgPicture.asset(
            AssetPath.upDownIcon,
          ),
        ],
      ),
    );
  }
}

class _CommentBoxWidget extends StatelessWidget {
  const _CommentBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        /// On Tap Event for Comment Box
        BlocProvider.of<VideoPlayerCubit>(context).pauseVideoPlayer();
        NavigationService.push(const CommentsPage());
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add Comment',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: kGreyTextColor,
              ),
            ),
            SvgPicture.asset(
              AssetPath.sendIcon,
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentListWidget extends StatelessWidget {
  const _CommentListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const _CommentListItemWidget(),
      separatorBuilder: (context, index) => Divider(
        height: 32,
        color: kGreyMedium,
      ),
    );
  }
}

class _CommentListItemWidget extends StatelessWidget {
  const _CommentListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImageBuilder(
            imgURl: "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg",
            borderRadius: BorderRadius.circular(100),
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Fahmida khanom',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kGreyTextColor,
                        ),
                      ),
                      TextSpan(
                        text: '    2 days ago',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: kGreyTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি',
                  style: GoogleFonts.hindSiliguri(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
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
