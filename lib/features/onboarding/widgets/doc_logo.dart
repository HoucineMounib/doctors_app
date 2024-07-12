import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogo extends StatelessWidget {
  const DocLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/svgs/logo.svg'),
    );
  }
}
