import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavouriteCard(title: 'Card 1', description: 'Flutter.'),
            FavouriteCard(title: 'Card 2', description: 'Game Development.'),
            FavouriteCard(title: 'Card 3', description: 'This is freetime.'),
          ]
        ),
      ),
    ));

// stateless widget to 
// class FavouriteCard extends StatelessWidget {

//   final bool isFavourite = false;
//   const FavouriteCard({super.key, this.isFavourite = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // YOUR CODE
//       decoration: const BoxDecoration(
//         border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
//       ),
//       padding: EdgeInsets.all(20),
//       child: Row(children: [
//         const Expanded(
//           flex: 7,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('title', style:(TextStyle(color: Colors.blue, fontWeight: FontWeight.w800)),),
//               SizedBox(height: 10),
//               Text('description', style:(TextStyle(color: Colors.black)),),
//             ],
//           ),
//         ),
//         IconButton(
//               onPressed: () => {},
//               icon: Icon(Icons.favorite, color: isFavourite ? Colors.red: Colors.grey,) 
//         )
//       ],),    
//     );
//   }
//}


class FavouriteCard extends StatefulWidget {
  final String title;
  final String description;

  const FavouriteCard({super.key, required this.title, required this.description});

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool isFavourite = false;

  Color get iconColor => isFavourite ? Colors.red : Colors.grey; 
  IconData get iconType => isFavourite ? Icons.favorite : Icons.favorite_border;

  void handleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),),
                SizedBox(height: 10),
                Text(widget.description, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            icon: Icon(iconType, color: iconColor),
          ),
        ],
      ),
    );
  }
}