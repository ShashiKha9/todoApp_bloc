import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final int currentTab;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                     onTabSelected(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 0 ? const Icon(Icons.house_rounded,
                          color: Colors.blue,) :
                        const Icon(Icons.house_outlined,
                          color: Colors.grey,),

                        Text(
                          "All", style: TextStyle(color: currentTab == 0 ?
                        Colors.blue : Colors.grey),)
                      ],
                    )
                ),

                MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      onTabSelected(1);


                    },
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1 ?  const Icon(Icons.star_rounded,
                          color: Colors.blue,) :
                        const Icon(Icons.star_border_rounded,
                          color: Colors.grey,),

                        Text(
                          "Completed", style: TextStyle(color: currentTab == 1 ?
                        Colors.blue : Colors.grey),),


                      ],
                    )
                ),


              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      onTabSelected(2);


                    },
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2 ?  const Icon(Icons.style_rounded,
                          color: Colors.blue,) :
                        const Icon(Icons.style_outlined,
                          color: Colors.grey,),

                        Text(
                          "Pending", style: TextStyle(color: currentTab == 2 ?
                        Colors.blue : Colors.grey),),
                      ],
                    )
                ),

                MaterialButton(
                    minWidth: 40,
                    onPressed: () {

                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(Icons.access_time_outlined),
                        Text("Reminder")
                      ],
                    )
                ),


              ],
            )

          ],
        ),
      ),


    );
  }
}