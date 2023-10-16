import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_way_app/ui/blocs/navigation/nav_bar_items.dart';
import 'package:the_way_app/ui/blocs/navigation/navigation_cubit.dart';

import 'FooterBarIcon/footer_bar_icon.dart';

class FooterBar extends StatelessWidget {
  //final NavigationState state;

  const FooterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;
    int currentIndex = 0;

    final primaryColor = Colors.blue;
    final secondaryColor = Colors.black54;
    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colors.white;

    final shadowColor = Colors.grey; //color of Navbar shadow
    double elevation = 100; //Elevation of the bottom Navbar

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height),
            painter: BottomNavCurvePainter(
                backgroundColor: backgroundColor,
                shadowColor: shadowColor,
                elevation: elevation),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                elevation: 0.1,
                onPressed: () {},
                child: const Icon(FontAwesomeIcons.barcode)),
          ),
          Container(
            height: height,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FooterBarIcon(
                  text: "Home",
                  icon: Icons.home,
                  selected: true,
                  onPressed: () {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavBarItem.home);
                  },
                  defaultColor: secondaryColor,
                  selectedColor:
                      currentIndex == 0 ? primaryColor : secondaryColor,
                ),
                FooterBarIcon(
                  text: "Search",
                  icon: Icons.search_outlined,
                  selected: false,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor:
                      currentIndex == 1 ? primaryColor : secondaryColor,
                ),
                const SizedBox(width: 56),
                FooterBarIcon(
                    text: "Cart",
                    icon: Icons.local_grocery_store_outlined,
                    selected: false,
                    onPressed: () {},
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                FooterBarIcon(
                  text: "Calendar",
                  icon: Icons.date_range_outlined,
                  selected: false,
                  onPressed: () {},
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white,
      this.insetRadius = 38,
      this.shadowColor = Colors.grey,
      this.elevation = 100});

  Color backgroundColor;
  Color shadowColor;
  double elevation;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;

    path.lineTo(insetCurveBeginnningX, 0);
    path.arcToPoint(Offset(insetCurveEndX, 0),
        radius: Radius.circular(41), clockwise: true);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
