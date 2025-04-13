import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class NewsDetailsViewBody extends StatelessWidget {
  const NewsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  
                  height: 420,
                  width: 431,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage('Assets/Images/science.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              maxLines: 3, //
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              'There is no description available for this book',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.93),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'April 12, 2022',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.25, color: kLightGrey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'The Remaining of the description',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.26),
            ),
          ),
        ],
      ),
    );
  }
}
