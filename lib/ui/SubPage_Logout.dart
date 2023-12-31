import 'package:flutter/material.dart';
import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SPageDangxuat extends StatelessWidget {
  const SPageDangxuat({super.key});
  static int idpage = 5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
          color: AppConstant.backgroundColor,
          child: const Center(
            child: Text("Đăng xuất"),
          )),
    );
  }
}
