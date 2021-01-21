import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';

class ListAction extends StatefulWidget {
  @override
  _ListActionState createState() => _ListActionState();
}

class _ListActionState extends State<ListAction> {
  int selectedAction = 0;
  List<String> actions = ["Watched", "My List", "Rating"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_24.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sizes.dimen_20.w),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedAction = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: index == selectedAction
                        ? Colors.white
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
              child: Text(
                actions[index],
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: index == selectedAction
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
