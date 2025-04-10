import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/presentation/widgets/categories_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            // لو كنت حطيت كولمن وحطيت فيه نيوز ليست فيو وال كاتيجوري ليست فيو كان هيظهر اكسبشن لان النيوز ليست فيو بتاكسباند ودا مينفعش يحصل جوا الكولوم
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
