part of 'profile_image_provider.dart';

abstract class ProfileImageState {
  const ProfileImageState();
}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageLoading extends ProfileImageState {}

class ProfileImageSuccess extends ProfileImageState {}

class ProfileImageError extends ProfileImageState {
  final String message;
  const ProfileImageError(this.message);
}
