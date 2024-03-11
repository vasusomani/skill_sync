import 'package:flutter/material.dart';

import '../../components/containers/rank_box_widget.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/leaderboard_wall.png")),
            ),
          ),
          const RankBoxWidget(rank: 1, name: "Gian Hai Aap", n: 20),
          const RankBoxWidget(rank: 2, name: "Haaw King", n: 18),
          const RankBoxWidget(rank: 3, name: "Arpit Bala", n: 15),
          const RankBoxWidget(rank: 4, name: "Puneet Superstar", n: 12),
          const RankBoxWidget(rank: 5, name: "Dolly ki Chai", n: 10),
          const RankBoxWidget(rank: 6, name: "Paani Paani Paani", n: 8),
          const RankBoxWidget(rank: 7, name: "Bole jo Koyal", n: 7),
          const RankBoxWidget(rank: 8, name: "Elvish Bhaiii", n: 6),
          const RankBoxWidget(rank: 9, name: "Sendha Namak", n: 6),
          const RankBoxWidget(rank: 10, name: "Doctor Salunke", n: 5)
        ],
      ),
    );
  }
}
