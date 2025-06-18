import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.itemAnimationProperties = const ItemAnimation(),
    this.height,
    super.key,
  });

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final double? height;

  /// This controls the animation properties of the items of the NavBar.
  final ItemAnimation itemAnimationProperties;

  Widget _buildItem(ItemConfig item, bool isSelected) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconTheme(
        data: IconThemeData(
          size: item.iconSize,
          color: isSelected ? AppColor.primary : item.inactiveForegroundColor,
        ),
        child: isSelected ? item.icon : item.inactiveIcon,
      ),
      if (item.title != null)
        FittedBox(
          child: Text(
            item.title!,
            style: TextStyle(
              color: isSelected
                  ? AppColor.primary
                  : item.inactiveForegroundColor,
              fontSize: 12,
            ),
          ),
        ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final double itemWidth =
        (MediaQuery.of(context).size.width -
            navBarDecoration.padding.horizontal * 2) /
        navBarConfig.items.length;
    return DecoratedNavBar(
      decoration: NavBarDecoration(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: navBarDecoration.padding.horizontal,
        ),
        color: navBarDecoration.color,
      ),
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              AnimatedContainer(
                duration: itemAnimationProperties.duration,
                curve: itemAnimationProperties.curve,
                width: itemWidth * navBarConfig.selectedIndex,
                height: 8,
              ),
              AnimatedContainer(
                duration: itemAnimationProperties.duration,
                curve: itemAnimationProperties.curve,
                width: itemWidth,
                height: 8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.primary,

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navBarConfig.items.map((item) {
              final int index = navBarConfig.items.indexOf(item);
              return Flexible(
                child: InkWell(
                  onTap: () {
                    navBarConfig.onItemSelected(index);
                  },
                  child: Center(
                    child: _buildItem(
                      item,
                      navBarConfig.selectedIndex == index,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
