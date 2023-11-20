import 'package:daily_news/core/widgets/shimmer/shimmer_item.dart';
import 'package:daily_news/core/widgets/shimmer/shimmer_layout.dart';
import 'package:flutter/material.dart';

class LoadingArticleItem extends StatelessWidget {
  const LoadingArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ShimmerLayout(
        child: Row(
          children: [
            ShimmerItem(height: 120, width: 120),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    ShimmerItem(),
                    SizedBox(height: 10),
                    ShimmerItem(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
