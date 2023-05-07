
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTextButton extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  final VoidCallback? onTap;

  const IconTextButton({
    Key? key,
    this.iconData,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.purpleAccent,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    iconData,
                    color: Colors.purpleAccent,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    text.toString(),
                    style: GoogleFonts.inter(
                        fontSize: 16.0, color: Colors.purpleAccent),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
