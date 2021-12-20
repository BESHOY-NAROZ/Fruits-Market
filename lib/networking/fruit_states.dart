class FruitStates {}

class FruitInitialState extends FruitStates {}

class FruitLoadingLoginState extends FruitStates {}

class FruitCompleteLoginState extends FruitStates {}

class FruitErrorLoginState extends FruitStates {
  var error;

  FruitErrorLoginState(this.error);
}

class FruitLoadingRegisterState extends FruitStates {}

class FruitCompleteRegisterState extends FruitStates {}

class FruitErrorRegisterState extends FruitStates {
  var error;

  FruitErrorRegisterState(this.error);
}

class FruitLoadingCreateState extends FruitStates {}

class FruitCompleteCreateState extends FruitStates {}

class FruitErrorCreateState extends FruitStates {
  var error;

  FruitErrorCreateState(this.error);
}

class FruitLoadingMailState extends FruitStates {}

class FruitCompleteCreateMailState extends FruitStates {}

class FruitErrorMailState extends FruitStates {
  var error;

  FruitErrorMailState(this.error);
}

class FruitCompleteInstanceState extends FruitStates {}

class FruitCompleteGetDataState extends FruitStates {}

class FruitChangeBottomNavState extends FruitStates {}

class ShopPasswordVisibilityState extends FruitStates {}

class FruitImagePickerState extends FruitStates {}

class FruitCompleteUploadImagesState extends FruitStates {}

class FruitErrorUploadImagesState extends FruitStates {}

class FruitCompleteUploadCoversState extends FruitStates {}

class FruitErrorUploadCoverState extends FruitStates {}

/// POST
class FruitCompleteCreatePostState extends FruitStates {}

class FruitErrorCreatePostState extends FruitStates {}

class FruitImagePickerPostState extends FruitStates {}

class FruitCloseSelectedPostImageState extends FruitStates {}

class FruitCompleteUploadPostImagesState extends FruitStates {}

class FruitErrorUploadPostImagesState extends FruitStates {}

class FruitCompleteGetPostElementState extends FruitStates {}

class FruitCompleteGetPostState extends FruitStates {}

class FruitErrorGetPostState extends FruitStates {}

class FruitCompleteLikedState extends FruitStates {}

class FruitErrorLikedState extends FruitStates {}

class FruitCompleteGetLikedState extends FruitStates {}

class FruitErrorGetLikedState extends FruitStates {}

class FruitCompleteGetPostLikesState extends FruitStates {}

class FruitErrorGetPostLikesState extends FruitStates {}

class FruitCompleteGetAllUsersState extends FruitStates {}

class FruitErrorGetAllUsersState extends FruitStates {}

class FruitCompleteGetMessagesState extends FruitStates {}
