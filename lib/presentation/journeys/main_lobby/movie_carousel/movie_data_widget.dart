import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../themes/theme_text.dart';

class MovieDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
        builder: (context, state) {
      if (state is MovieBackdropChanged) {
        return Text(
          state.movie.title + " ( " + state.movie.releaseDate + " )",
          textAlign: TextAlign.center,
          maxLines: 1,
          style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
        );
      }
    });
  }
}
