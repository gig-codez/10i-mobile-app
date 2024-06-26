library exports;

// flutter libraries
export "package:flutter/material.dart";
export "package:flutter/services.dart";
export "package:provider/provider.dart";
export "package:google_fonts/google_fonts.dart";
export "package:shared_preferences/shared_preferences.dart";
export "package:flutter_spinkit/flutter_spinkit.dart";
export "package:flutter_svg/flutter_svg.dart";
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:pinput/pinput.dart';
export 'package:lottie/lottie.dart';
export 'package:qr_code_scanner/qr_code_scanner.dart';
export 'package:flutter/foundation.dart';
export 'package:pretty_qr_code/pretty_qr_code.dart';
export 'package:share_plus/share_plus.dart';
export "package:http/http.dart";
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:flutterwave_standard/flutterwave.dart';
export 'package:uuid/uuid.dart';
export 'package:jwt_decoder/jwt_decoder.dart';
export 'package:uni_links2/uni_links.dart';
export 'package:auto_size_text/auto_size_text.dart';

// themes
export "/themes/themes.dart";

// routes
export "/routes/routes.dart";

// controllers
export "/controllers/theme_controller.dart";
export "/controllers/loader_controller.dart";
export "/controllers/text_controller.dart";
export "/controllers/data_controller.dart";

// main
export "/main.dart";

// intro screens
export "/screens/intro/splash_screen.dart";
export "/screens/intro/on_boarding.dart";
export "/screens/intro/let_you_in.dart";
// auth pages
export "/screens/auth/login_screen.dart";
export "/screens/auth/create_account.dart";
export "/screens/auth/verify_email_screen.dart";
export "/screens/auth/account/reasons_page.dart";
export "/screens/auth/account/verify_phone.dart";
export "/screens/auth/account/verify_page.dart";
export "/screens/auth/account/finger_print.dart";
export "/screens/auth/account/verify_identity.dart";
export "/screens/auth/account/scan_document.dart";
export "/screens/auth/account/user_profile.dart";
export "/screens/auth/account/create_pin.dart";
export "/screens/auth/reset/forgot_password.dart";
export "/screens/auth/reset/reset_pin.dart";
export "/screens/auth/reset/new_password.dart";
export "/screens/home/bills/wallet.dart";
// auth widgets
export "/screens/auth/reset/widgets/dialog_widget.dart";

// home
export "/screens/home/home_screen.dart";
export "/screens/home/index_page.dart";
export "/screens/home/more_details.dart";
export "/screens/home/notifications.dart";
export "/screens/home/invoices.dart";
export "/screens/home/activity_page.dart";
export "/screens/home/analytics_page.dart";
// export "/screens/home/.dart";
// home - widgets
export "/screens/home/widgets/dash_card.dart";
export "/screens/home/widgets/services_widget.dart";
export "/screens/home/widgets/recent_activities.dart";
// payments
export "/screens/home/payments/scan_qrcode.dart";
export "/screens/home/payments/result_page.dart";
export "/screens/home/payments/payment_type.dart";
export "/screens/home/payments/review_summary.dart";
export "/screens/home/payments/payment_info.dart";
// transfers
export "/screens/home/transfers/index_page.dart";
export "../screens/home/transfers/transfer_money.dart";
export "/screens/home/transfers/transfer__review.dart";
export "/screens/home/transfers/transfer_success.dart";
export "/screens/home/transfers/bank_branches.dart";
// quick link
export "/screens/home/quick_link/quick_invoice.dart";
export "/screens/home/quick_link/quick_link.dart";
// screen => services
export "/screens/home/services/deposit.dart";
export "../screens/home/bills/utilities.dart";
export "/screens/home/services/reward.dart";

// screen => activity
export "/screens/home/activity/index_activity.dart";
export "/screens/home/activity/received_activity.dart";
export "/screens/home/activity/sent_activity.dart";
export "/screens/home/activity/all_activity.dart";
export "/screens/home/activity/activity_detail.dart";
// widgets
export "/screens/home/services/widget/payment_sumary.dart";

// services
export "/services/auth_service.dart";
export '/services/session_service.dart';
export '/services/storage_services.dart';
export '/services/fingerprint_service.dart';
export '/services/payment_service.dart';
export '/services/user_service.dart';
export '/services/bill_service.dart';

// bills
export "/screens/home/bills/electricity.dart";
export "/screens/home/bills/water.dart";
export "/screens/home/bills/internet.dart";
export "../screens/home/bills/confirm_payment.dart";
export "/screens/home/bills/success_payment.dart";

// split bills
export "/screens/home/split/split_bill.dart";
export "/screens/home/split/split_page.dart";
export "/screens/home/split/split_money.dart";
export "/screens/home/split/review_split.dart";
export "/screens/home/split/split_success.dart";
export "/screens/home/split/index.dart";
// send money
export '/screens/home/send/index.dart';
export '/screens/home/send/contacts.dart';
export '/screens/home/send/send_money.dart';
export '/screens/home/send/widget/contact_widget.dart';
// request money
export "/screens/home/request/index.dart";
export "/screens/home/request/request_money.dart";
export "/screens/home/request/favourites.dart";
export "/screens/home/request/allcontacts.dart";
export "/screens/home/request/confirm_prompt.dart";
export "/screens/home/request/request_success.dart";
// more
export "/screens/home/more/security.dart";
export "/screens/home/more/privacy.dart";
export "/screens/home/more/help_center.dart";
export "/screens/home/more/about_page.dart";
export "/screens/home/more/personal_info.dart";

// widgets
export "/widgets/space_widget.dart";
export '/widgets/custom_button.dart';
export "/widgets/tap_effect.dart";
export "/widgets/onboard_slide.dart";
export "/widgets/text_styles.dart";
export "/widgets/custom_text_field.dart";
export "/widgets/custom_radio_widget.dart";
export "/widgets/profile_widget.dart";
export "/widgets/divider_widget.dart";
export "/widgets/custom_select_widget.dart";
// helpers
export "/helpers/helpers.dart";

// apis
export "/apis/apis.dart";
export "/apis/network.dart";
export '/apis/connectivity.dart';

// models
export "/models/reasons_model.dart";
export "/models/user_model.dart";
export "/models/wallet_model.dart";
export "/models/wallet_balance_model.dart";
export "/models/payment_types.dart";
export "/models/contacts_model.dart";
export "/models/single_user.dart";
export "/models/bill_type_model.dart";
export "/models/bills_model.dart";

// extension
export "/extension/extension.dart";
