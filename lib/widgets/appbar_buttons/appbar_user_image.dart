import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/routes/routes.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/user_image_cubit.dart';
import 'package:mecore/modules/models/user_image.dart';

class AppbarUserImage extends StatelessWidget {
  const AppbarUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: BlocBuilder<UserImageCubit, UserImage>(builder: (context, state) {
        return Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border(
              right: mainBorderSide,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.go('/setting');
            },
            icon: (state.xFile != null)
                ? Image.network(
                    state.url,
                    height: appbarLength(context),
                    width: appbarLength(context),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/image/mecore_logo.png',
                    // 'assets/image/user_image.jpg',
                    height: appbarLength(context),
                    width: appbarLength(context),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
          ),
        );
      }),
    );
  }
}
