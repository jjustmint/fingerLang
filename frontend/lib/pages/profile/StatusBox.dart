import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/pages/profile/FavoritePage.dart';

class StatusBox extends StatelessWidget {
  final int successCount;
  final int favoriteCount;
  final VoidCallback? onTapFavorite;

  StatusBox({
    required this.successCount,
    required this.favoriteCount,
    this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      width: 358,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black45,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSection("Success", successCount),
          _buildVerticalDivider(),
          _buildFavoriteSection(context),
        ],
      ),
    );
  }

  Widget _buildSection(String title, int count) {
    return Container(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title == "Favorite")
                Icon(Icons.favorite, color: Colors.red, size: 30.0),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFA86944),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w800,
              color: Color(0xFFA86944),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 50,
      child: VerticalDivider(
        color: Colors.grey,
        thickness: 1.0,
      ),
    );
  }

  Widget _buildFavoriteSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTapFavorite != null) {
          onTapFavorite!();
        }
        // Navigate to FavoritePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritePage()),
        );
      },
      child: Container(
          width: 100,
          height: 100,
          color: Colors.white,
          child: _buildSection("Favorite", favoriteCount)),
    );
  }
}
