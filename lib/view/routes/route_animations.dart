import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget page;
  final String animationType;

  CustomRoute({required this.page, required this.animationType})
      : super(
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            switch (animationType) {
              case 'fade':
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              case 'slide':
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case 'slideUp':
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case 'scale':
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                );
              case 'size':
                return Align(
                  child: SizeTransition(
                    sizeFactor: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                );
              default:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
            }
          },
        );
}
