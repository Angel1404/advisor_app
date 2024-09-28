import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../themes/theme.dart';
import 'global_widgets.dart';

class AppDialogs {
  static void loading() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
    );
  }

  static Future information({
    String title = "",
    String description = "",
    bool isError = true,
    String? titleBtn,
    String? titleBtnCancel,
    Function()? onTap,
    Function()? onTapCancel,
    bool isCancelBtn = false,
  }) async {
    await Get.dialog(
      barrierDismissible: false,
      SimpleDialog(
        children: [
          SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isError) const Icon(Icons.clear, size: 50, color: Colors.red),
                if (isError == false) const Icon(Icons.check, size: 50, color: ColorApp.blue),
                AutoSizeTextApp(
                  title: title,
                  textStyle: StyleText.titleAppbar,
                  minFontSize: 12,
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                AutoSizeTextApp(
                  title: description,
                  textStyle: StyleText.descriptions,
                  minFontSize: 11,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: BtnApp(onPressed: onTap ?? () => Get.back(), titleBtn: titleBtn ?? "Ok"),
                      ),
                      if (isCancelBtn) ...[
                        const SizedBox(width: 5),
                        Flexible(
                          child: BtnApp(
                            onPressed: onTapCancel ?? () => Get.back(),
                            titleBtn: titleBtnCancel ?? "Aceptar",
                          ),
                        ),
                      ],
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // static getViewPhoto(String url) {
  //   Get.dialog(
  //     SimpleDialog(
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 10),
  //       children: [
  //         Container(
  //           color: Colors.black,
  //           height: Get.height * .8,
  //           width: Get.width * .9,
  //           child: PhotoView(
  //             backgroundDecoration: const BoxDecoration(color: Colors.black),
  //             maxScale: 0.9,
  //             minScale: 0.6,
  //             imageProvider: url.contains("https") || url.contains("http") ? CachedNetworkImageProvider(url) : Image.file(File(url)).image,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  static Future dialogGeneryPage(
    Widget page, {
    double insetPaddingH = 16,
    double? heigth,
    double? radius,
  }) async {
    await Get.dialog(
      barrierDismissible: false,
      SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 10)),
        titlePadding: const EdgeInsets.only(top: 26),
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.symmetric(horizontal: insetPaddingH, vertical: 24),
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: Get.height * (heigth ?? .8)),
            height: Get.height * (heigth ?? .8),
            width: Get.width,
            child: page,
          ),
        ],
      ),
    );
  }

  // static infoErrorDialog(BaseResponse response) {
  //   final errText =
  //       response.error == null ? response.errorText : "${response.error!.errorMessage} - ${response.error!.message} -${response.error!.errorCode}";
  //   information(
  //     title: TextsApp.upsError,
  //     description: errText ?? TextsApp.moreInfoAdminError,
  //     isError: true,
  //   );
  // }

  static snackInformation() {
    Get.snackbar(
      "WT",
      "Esta funcionalidad no está disponible de momento",
      backgroundColor: ColorApp.blue,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }
}
