import 'package:flutter/material.dart';

import 'package:linear_step_indicator/src/constants.dart';
import 'package:linear_step_indicator/src/linear_step_indicator.dart';

class StepIndicatorPageView extends StatelessWidget {
  ///Controller for tracking page changes.
  ///
  ///Typically, controller should animate or jump to next page
  ///when a step is completed
  final PageController controller;

  ///Number of nodes to paint on screen
  final int steps;

  ///StepIndicatorPageView's children widgets
  final List<Widget> children;

  ///[completedIcon] size
  final double iconSize;

  ///Size of each node
  final double nodeSize;

  ///Height of separating line
  final double lineHeight;

  ///Icon showed when a step is completed
  final IconData completedIcon;

  ///Color of each completed node border
  final Color activeBorderColor;

  ///Color of each uncompleted node border
  final Color inActiveBorderColor;

  ///Color of each separating line after a completed node
  final Color activeLineColor;

  ///Color of each separating line after an uncompleted node
  final Color inActiveLineColor;

  ///Background color of a completed node
  final Color activeNodeColor;

  ///Background color of an uncompleted node
  final Color inActiveNodeColor;

  ///Thickness of node's borders
  final double nodeThickness;

  ///Node's shape
  final BoxShape shape;

  ///[completedIcon] color
  final Color iconColor;

  ///Step indicator's background color
  final Color backgroundColor;

  ///Boolean function that returns [true] when last node should be completed
  final Complete? complete;

  ///Step indicator's vertical padding
  final double verticalPadding;

  ///Spacing from top of the screen if [indicatorPosition] is [IndicatorPosition.top]
  final double spacing;

  ///Spacing from bottom of the screen if [indicatorPosition] is [IndicatorPosition.bottom]
  final double bottomSpacing;

  ///Indicator's position
  final IndicatorPosition indicatorPosition;

  ///Labels for individual nodes
  final List<String> labels;

  ///Textstyle for an active label
  final TextStyle? activeLabelStyle;

  ///Textstyle for an inactive label
  final TextStyle? inActiveLabelStyle;

  final ValueChanged<dynamic>? onChanged;

  final bool enable;

  final bool done;

  const StepIndicatorPageView({
    Key? key,
    required this.controller,
    required this.steps,
    required this.children,
    this.iconSize = kIconSize,
    this.nodeSize = kDefaultSize,
    this.lineHeight = kDefaultLineHeight,
    this.completedIcon = kCompletedIcon,
    this.activeBorderColor = kActiveColor,
    this.inActiveBorderColor = kInActiveColor,
    this.activeLineColor = kActiveLineColor,
    this.inActiveLineColor = kInActiveLineColor,
    this.activeNodeColor = kActiveColor,
    this.inActiveNodeColor = kInActiveNodeColor,
    this.nodeThickness = kDefaultThickness,
    this.shape = BoxShape.circle,
    this.iconColor = kIconColor,
    this.backgroundColor = kIconColor,
    this.complete,
    this.verticalPadding = kDefaultSize,
    this.spacing = kDefaultSize,
    this.bottomSpacing = 0,
    this.indicatorPosition = IndicatorPosition.top,
    this.labels = const <String>[],
    this.activeLabelStyle,
    this.inActiveLabelStyle,
    this.onChanged,
    this.enable = false,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            if (indicatorPosition == IndicatorPosition.top) ...[
              LinearStepIndicator(
                labels: labels,
                steps: steps,
                controller: controller,
                backgroundColor: backgroundColor,
                complete: complete,
                activeBorderColor: activeBorderColor,
                inActiveBorderColor: inActiveBorderColor,
                activeLineColor: activeLineColor,
                inActiveLineColor: inActiveLineColor,
                activeNodeColor: activeNodeColor,
                inActiveNodeColor: inActiveNodeColor,
                shape: shape,
                done: done,
                iconColor: iconColor,
                iconSize: iconSize,
                verticalPadding: verticalPadding,
                completedIcon: completedIcon,
                lineHeight: lineHeight,
                nodeSize: nodeSize,
                nodeThickness: nodeThickness,
                activeLabelStyle: activeLabelStyle,
                inActiveLabelStyle: inActiveLabelStyle,
              ),
              SizedBox(height: spacing),
            ],
            Expanded(
              child: PageView(
                controller: controller,
                children: children,
                onPageChanged: onChanged,
                physics: enable
                    ? BouncingScrollPhysics()
                    : NeverScrollableScrollPhysics(),
              ),
            ),
            if (indicatorPosition == IndicatorPosition.bottom) ...[
              SizedBox(height: spacing),
              LinearStepIndicator(
                steps: steps,
                controller: controller,
                backgroundColor: backgroundColor,
                complete: complete,
                activeBorderColor: activeBorderColor,
                inActiveBorderColor: inActiveBorderColor,
                activeLineColor: activeLineColor,
                inActiveLineColor: inActiveLineColor,
                activeNodeColor: activeNodeColor,
                inActiveNodeColor: inActiveNodeColor,
                shape: shape,
                iconColor: iconColor,
                iconSize: iconSize,
                verticalPadding: verticalPadding,
                completedIcon: completedIcon,
                lineHeight: lineHeight,
                nodeSize: nodeSize,
                nodeThickness: nodeThickness,
                 done: done,
              ),
              SizedBox(height: bottomSpacing),
            ],
          ],
        ),
      ),
    );
  }
}

enum IndicatorPosition { top, bottom }
