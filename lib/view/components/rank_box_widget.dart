import 'package:flutter/material.dart';

class RankBoxWidget extends StatelessWidget {
  final int rank;
  final String name;
  final int n;
  const RankBoxWidget({
    super.key,
    required this.rank,
    required this.name,
    required this.n,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 5),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (rank<4)?
          ((rank<3)?
          ((rank<2)?
          (Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/rank1_gem.png"))
            ),
          )):
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/rank2_gem.png"))
            ),
          )
          ):
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/rank3_gem.png"))
            ),
          )):
          Text(rank.toString(),style: TextStyle(color: Color(0xffffbc0e),fontSize: 22,fontWeight: FontWeight.bold),),

          Text(name,style: TextStyle(color: Color(0xffffbc0e),fontWeight: FontWeight.bold,fontSize: 18,),),

         Text(n.toString()+" projcts completed",style: TextStyle(color: Colors.white,fontSize: 13))
        ],
      ),
    );
  }
}
