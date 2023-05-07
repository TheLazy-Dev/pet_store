import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pet_store/gen/assets.gen.dart';
import 'package:pet_store/presentation/screens/home/home_main.dart';

class MainSplash extends StatelessWidget {
  const MainSplash({super.key});

  @override
  Widget build(BuildContext context) {
    doneSpalsh(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    Assets.images.adoptPetConcept.keyName,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: WavyContainer(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Center(
                      child: Container(
                        height: 30,
                        width: 150,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {},
                            child: Center(
                                child: Text(
                              "Let's Adopt",
                              style: GoogleFonts.inter(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ))),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WavyContainer extends StatelessWidget {
  const WavyContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: ClipPath(
        clipper: WavyClipper(),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[200]!,
                Colors.blue[700]!,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);

    final firstControlPoint = Offset(size.width / 4, size.height * 0.85);
    final firstEndPoint = Offset(size.width / 2.25, size.height * 0.75);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height * 0.65);
    final secondEndPoint = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

doneSpalsh(BuildContext context) async {
  Future.delayed(
    const Duration(seconds: 2),
    () => Navigator.pushReplacementNamed(context, Home.id),
  );
}
