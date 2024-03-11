import 'package:flutter/material.dart';
import 'package:profile_page/components/rank_box_widget.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          const SizedBox(height:100),
          Text("LEADERBOARD",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/leaderboard_wall.png")),
            ),
          ),
          RankBoxWidget(rank: 1, name: "Gian Hai Aap", n: 20),
          RankBoxWidget(rank: 2, name: "Haaw King", n: 18),
          RankBoxWidget(rank: 3, name: "Arpit Bala", n: 15),
          RankBoxWidget(rank: 4, name: "Puneet Superstar", n: 12),
          RankBoxWidget(rank: 5, name: "Dolly ki Chai", n: 10),
          RankBoxWidget(rank: 6, name: "Paani Paani Paani", n: 8),
          RankBoxWidget(rank: 7, name: "Bole jo Koyal", n: 7),
          RankBoxWidget(rank: 8, name: "Elvish Bhaiii", n: 6),
          RankBoxWidget(rank: 9, name: "Sendha Namak", n: 6),
          RankBoxWidget(rank: 10, name: "Doctor Salunke", n: 5)
        ],

      ),
    );
  }
}
