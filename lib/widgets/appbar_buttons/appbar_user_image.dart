import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/user_image_cubit.dart';
import 'package:mecore/modules/models/user_image.dart';

class AppbarUserImage extends StatelessWidget {
  const AppbarUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: BlocBuilder<UserImageCubit, UserImage>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border(
                right: mainBorderSide,
              ),
            ),
            child: (state.xFile != null) ? Image.network(state.url, fit: BoxFit.cover,) : Image.asset(
              'assets/image/mecore_logo.png',
              // 'assets/image/user_image.jpg',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          );
        }
      ),
    );
  }
}
