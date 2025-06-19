import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_event.dart';
import 'package:auvnet_internship_task/Features/profile/widgets/get_image_url.dart';
import 'package:auvnet_internship_task/core/di/services_locator.dart';
import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var user = AuthBloc.userInfo;

    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Image.network(
                      fit: BoxFit.fill,
                      UserImages.userImages[0],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      radius: 70,
                      child: Hero(
                        tag: 'profilePhoto',
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                            UserImages.userImages[1],
                          ),
                        ),
                      ),
                    ),
                    // if (userModel == sl<SocialCubit>().model)
                    IconButton(
                      onPressed: () async {
                        UserImages.fetchUserImages();
                      },
                      icon: CircleAvatar(
                        radius: 18,
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          user?['full_name'] ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(user?['email'] ?? '', style: TextStyle(fontSize: 16)),
        Expanded(
          child: Center(
            child: Text(
              'Stay Tuned!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            sl<AuthBloc>().add(AuthLogoutRequested());
            Restart.restartApp();
          },
          child: Text("Logout", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
