import 'package:flutter/material.dart';

class QueryGrid extends StatelessWidget {
  const QueryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gap = MediaQuery.of(context).size.width * 0.013;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: gap,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: 222,
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: gap,
                      ),
                  itemCount: 5),
            ),
            SizedBox(
              width: gap,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: 275,
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        height: 155,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: gap,
                      ),
                  itemCount: 5),
            ),
            SizedBox(
              width: gap,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: 222,
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: gap,
                      ),
                  itemCount: 5),
            ),
          ],
        ),
      ),
    );
  }
}
