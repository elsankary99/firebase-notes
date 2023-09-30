class AppStrings {
  // App name
  static const String appName = 'HaBIT Note';

  // App version
  static const String appVersionText = 'V0.1.2-beta3';
  static const String appVersionText2 = 'Version 0.1.2-beta3';

  // App copyright
  static const String appCopyright =
      '© Copyright HaBIT Note 2022. All rights reserved.';

  // Texts
  static const String createAccount = 'CREATE ACCOUNT';
  static const String tapToView = 'Tap to view';
  static const String notes = 'Notes';
  static const String pleaseEnterYourAccount =
      ' Please enter your account’s email address \n and we will send you a link \n to reset your password.   ';
  static const String enterYourDetails = 'Enter your details to continue';
  static const String letKnowYou = 'Let’s get to know you !';
  static const String welcomeBack = 'Welcome Back !';
  static const String dntHaveAccount = 'Don`t have an account ?  ';
  static const String alreadyHaveAccount = 'Already have an account ?  ';
  static const String pleaseLoginWithEmail = 'Please Login With Your Email';
  static const String emailAddress = 'Email Address';
  static const String sureExitTheApp = 'Are you sure you want to exit the app?';
  static const String sureLogOut = 'Are you sure you want to log out?';
  static const String clearImage = 'Clear Image';
  static const String iHaveAgreeToOur = "I have agree to our ";
  static const String termsAndCondition = "Terms and Condition";
  static const String scanImage = 'Scan Image';
  static const String userName = 'User Name';
  static const String login = 'LOG IN';
  static const String signUP = 'Sign UP';
  static const String logout = 'LOG OUT';
  static const String back = 'BACK TO DASHBOARD';
  static const String exit = 'Exit';
  static const String optionNo = 'No';
  static const String galleryNotesScreen = 'Gallery';
  static const String ocrScreen = 'Image to Text';
  static const String helpScreen = 'Help';
  static const String meScreen = 'Me';
  static const String help_note_title = 'Notes';
  static const String help_ocr_title = 'Image to text (OCR)';
  static const String help_sub_reminder_title = 'Subscription reminder';
  static const String help_account_title = 'My account settings';

  // Handle form error
  final RegExp emailValidatorRegex =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kNameNullError = 'Username is required';
  static const String kEmailNullError = 'Email is required';
  static const String kInvalidEmailError =
      'Enter in the format: name@example.com';
  static const String kPassNullError = 'Cannot be blank';
  static const String kShortPassError = 'At least 6 characters';
  static const String kMatchPassError = 'Passwords do not match';

  // Handle Return/Back Button
  static const String pressAgain = 'Press back again to exit app';
  static const name = 'Name';
  static const with_social_media = 'with social media';
  static const continue_with_google = 'Continue with Google';
  static const continue_with_apple = 'Continue with apple';
  static const email_already_exits = 'This email is already exists';
  static const forgot_pwd = 'Forgot Password';
  static const forgotPassword = 'Forgot Password ?';
  static const dark_mode = 'Dark Mode';
  static const home_empty_note = 'Create your first note !';
  static const add_note = 'Note';
  static const add_todo = 'To-do';
  static const add_image = 'Note with Image';
  static const delete_note = 'Delete note';
  static const delete_todo = 'Delete to-do';
  static const select_colour = 'Select colour';
  static const select_colour2 = 'SELECT COLOUR';
  static const delete = 'Delete';
  static const delete2 = 'DELETE';
  static const password = 'Password';
  static const cancel = 'Cancel';
  static const submit = 'Submit';
  static const reset_filter_text = 'Reset';
  static const type_something_here = 'Type something awesome here';
  static const type_something_here2 = "What's your to-do ?";
  static const confirm_to_delete_note = 'Confirm to delete note ?';
  static const select_option = 'Select option';
  static const unlock_note = 'Unlock note';
  static const lock_note = 'Lock note';
  static const lock_unlock_note = 'Lock & Unlock Note';
  static const create_lock_note_pwd = 'Create a master password';
  static const select_layout = 'Select layout';
  static const lock_notes_pwd = 'Password';
  static const reset_acc_pwd = 'RESET ACCOUNT PASSWORD';
  static const reset_pwd = 'Reset Password';
  static const enter_master_pwd = 'Enter master password';
  static const change_master_pwd = 'Change Master Password';
  static const change_master_pwd2 = 'CHANGE MASTER PASSWORD';
  static const labels = 'Labels';
  static const edit = 'Edit';
  static const help = 'Help';
  static const ocr = 'OCR';
  static const add_todo_image = 'Add Image';
  static const from_camera = 'Take photo';
  static const from_gallery = 'Choose photo';
  static const clear = 'Cleared';
  static const no_image = 'Error, please upload an image';
  static const settings_change_master_pwd = 'Change Master Password';
  static const settings_change_pwd = 'Change Account Password';
  static const about = 'About';
  static const settings_info_about_us = 'About Us';
  static const settings_info_pp = 'Privacy Policy';
  static const settings_info_tou = 'Terms of Use';
  static const support_email = 'Support Email';
  static const invalid_pwd = 'Invalid/wrong password';
  static const pwd_length = 'Password length must be 4';
  static const pwd_not_same = 'Password not same';
  static const confirm_pwd = 'Confirm password';
  static const confirm_new_pwd = 'Confirm new password';
  static const current_pwd = 'Current password';
  static const current_pwd_invalid = 'Current password is invalid';
  static const new_pwd = 'New password';
  static const change_acc_pwd = 'Change Account Password';
  static const change_acc_pwd2 = 'CHANGE ACCOUNT PASSWORD';
  static const pwd_changed_successfully = 'Password changed successfully';
  static const pwd_reset_successfully = 'Password reset successfully';
  static const log_out = 'Log Out';
  static const log_out_text = 'Are you sure you want to log out ?';

  static const reminder_empty_note = 'Create your first reminder !';
  static const sub_reminder = 'Subscription Reminder';
  static const add_new_subscription = 'My Subscription';
  static const update = 'UPDATE';
  static const save = 'SAVE';
  static const MYR = 'MYR';
  static const ringgit_icon = 'RM';
  static const date_format = 'yyyy-MM-dd';
  static const datetime_format = 'yyyy-MM-dd HH:mm a';
  static const expired = 'EXPIRED';
  static const description = 'Description';
  static const recurring = 'Recurring';
  static const one_time = 'One time';
  static const billing_period = 'Billing period';
  static const first_payment = 'First payment';
  static const exp_date = 'Expiry date';
  static const pay_method = 'Payment method';
  static const shared_by = 'Shared By';
  static const reminder = 'Reminder';
  static const on_same_day = 'On the same day';
  static const next_payment = 'Next payment';
  static const subscription_exp =
      'Subscription expired. Setting a notification is not allowed';
  static const subscription_detail = 'Subscription Detail';
  static const delete_sub = 'Delete subscription';
  static const confirm_to_delete_sub = 'Confirm to delete subscription ?';
  static const share_note_change_not_allow =
      'This is shared note, changes are not allow';

  static const collaborator = 'Collaborator';
  static const collaborators = 'Collaborators';
}
