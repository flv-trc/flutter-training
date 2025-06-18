import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAdaptiveRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const PlatformAdaptiveRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: onRefresh),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (separatorBuilder != null && index.isOdd) {
                  return separatorBuilder!(context, index ~/ 2);
                }
                final itemIndex = separatorBuilder != null ? index ~/ 2 : index;
                return itemBuilder(context, itemIndex);
              },
              childCount: separatorBuilder != null
                  ? itemCount * 2 - 1
                  : itemCount,
            ),
          ),
        ],
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder ?? (_, _) => const SizedBox.shrink(),
      ),
    );
  }
}
