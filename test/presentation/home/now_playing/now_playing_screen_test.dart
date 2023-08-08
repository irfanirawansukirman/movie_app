import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/injector.dart' as inject;
import 'package:mvvm_movie_app/presentation/home/now_playing/now_playing_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/now_playing/now_playing_screen.dart';

class MockNowPlayingCubit extends MockCubit<NowPlayingState>
    implements NowPlayingCubit {}

class FakeNowPlayingState extends Fake implements NowPlayingState {}

void main() {
  late MockNowPlayingCubit mockNowPlayingCubit;

  setUp(() {
    mockNowPlayingCubit = MockNowPlayingCubit();
  });

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakeNowPlayingState());

    inject.locator.registerFactory(() => mockNowPlayingCubit);
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<NowPlayingCubit>.value(
      value: mockNowPlayingCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'should show progress indicator when state is loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockNowPlayingCubit.state).thenReturn(NowPlayingInitial());

      // act
      await tester.pumpWidget(_makeTestableWidget(const NowPlayingScreen()));

      // assert
      expect(find.byType(ProgressViewWidget), equals(findsOneWidget));
    },
  );
}
