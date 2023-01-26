import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //cambiar leugo por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        //invesitgar los sliders son widgets que tienen comportamineto preporgramado
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              const CastingCards(),
            ]),
          ),
        ],
      ),
    );
  }
}

//tienen comportamiento cuando se hace  scroll
class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              height: 140,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      child: Text(
        'Una película (del latín pellicula, diminutivo de pellis, «piel»), también llamado filme, es una serie de imágenes fijas que, cuando se proyectan en una pantalla de forma consecutiva en rápida sucesión, crean la ilusión óptica de imágenes en movimiento.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
