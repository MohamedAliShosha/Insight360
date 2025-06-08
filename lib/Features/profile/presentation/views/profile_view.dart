import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/profile/presentation/widgets/profile_view_body.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LocalStorageCubit(LocalStorageService())..getUserData(),
        child: const ProfileViewBody(),
      ),
    );
  }
}
