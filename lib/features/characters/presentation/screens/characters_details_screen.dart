import '../../../../core/widgets/widgets.dart';
import '../widgets/character_Info.dart';
import '../widgets/quote_widget.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/models/character.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            floating: false,
            stretch: true,
            backgroundColor: AppColors.yellow,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: const TextStyle(
                  color: AppColors.gray,
                ),
              ),
              background: Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(title: 'Status', value: character.status),
                      CharacterInfo(title: 'Species', value: character.species),
                      if (character.type.isNotEmpty) CharacterInfo(title: 'Type', value: character.type),
                      CharacterInfo(title: 'Origin', value: character.origin.name),
                      CharacterInfo(title: 'Gender', value: character.gender),
                      CharacterInfo(title: 'Location', value: character.location.name),
                      CharacterInfo(title: 'Episode', value: character.episode.join(' / ')),
                      CharacterInfo(title: 'Created', value: character.created.toIso8601String()),
                      offline(
                        const QuoteWidget(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
