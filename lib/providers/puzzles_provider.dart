import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter/cupertino.dart';

class PuzzlesProvider with ChangeNotifier {
  late var levelCount;
  List<Puzzles> _puzzlesList = [
    Puzzles(),
    Puzzles(
        levelNumber: 2,
        pgn:
            '1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Be7 6. d4 d6 7. O-O Nf6 8. d5 Nb8 9. Nbd2 O-O 10. h3 Nbd7 11. Bd3 a5 12. a4 b6 13. Qe2 Nc5 14. Bc2 Ba6 15. c4 h6 16. Nh2 Nh7 17. f4 exf4 18. Rxf4 Bf6 19. Ra3 Be5 20. Rf1 Ng5 21. Ng4 Qe7 22. Nxe5 Qxe5 23. Qg4 Rae8 24. Re3 Qd4 25. Nf3 Nxf3+ 26. Qxf3 Bxc4 27. Rd1 Qe5 28. Bd2 Qg5',
        solution: '29. Rc3 Be2,30. Qxe2'),
    Puzzles(
        levelNumber: 3,
        pgn:
            '1. d4 d5 2. c4 c6 3. Nf3 Bg4 4. e3 Bxf3 5. Qxf3 Nf6 6. Nd2 e6 7. cxd5 exd5 8. b3 g6 9. Bb2 Bg7 10. Bd3 O-O 11. O-O Nbd7 12. Rac1 Re8 13. Rfe1 Nf8 14. Qg3 Ne4 15. Nxe4 dxe4 16. Bc2 Nd7 17. Qf4 Nf6 18. f3 Nd5 19. Qg3 f5 20. fxe4 fxe4 21. Bb1 Bh6 22. Rc2 Qg5 23. Qxg5 Bxg5 24. Rce2 a5 25. a4 Re6 26. Bc1 Rae8 27. Rf2 Nc3 28. Bc2 b5 29. axb5 cxb5 30. Bd2 Rc8 31. g3 b4 32. h4 Bh6 33. Ra1 Ra8 34. g4 Bf8 35. Rf4 Bd6 36. Rf2 Bg3 37. Rg2 Bxh4 38. Bxc3 bxc3 39. b4 Bd8 40. bxa5 Rxa5',
        solution: '41. Rxa5 Bxa5,42. Bb3'),
    Puzzles(
        levelNumber: 4,
        pgn:
            '1. d4 Nf6 2. c4 e6 3. Nc3 Bb4 4. e3 O-O 5. Qc2 d5 6. Nf3 b6 7. Be2 Bb7 8. O-O Nbd7 9. a3 Bxc3 10. bxc3 dxc4 11. Bxc4 c5 12. Bb2 Bxf3 13. gxf3 cxd4 14. cxd4 Rc8 15. Qe2 Nd5 16. f4 Qh4 17. Bd3 N7f6 18. Kh1 Ng4 19. f3 Ngxe3 20. Rg1 Qxf4 21. Bc1 Qxd4 22. Bb2 Nc3 23. Qd2 Ned5',
        solution: '24. Bxh7+ Kxh7,25. Qxd4'),
    Puzzles(
        levelNumber: 5,
        pgn:
            '1. e4 c5 2. Nf3 d6 3. d4 cxd4 4. Nxd4 Nf6 5. Nc3 a6 6. Be2 e5 7. Nb3 Be7 8. Be3 Be6 9. O-O O-O 10. f4 exf4 11. Rxf4 Nc6 12. Nd4 Ne5 13. Nf5 Rc8 14. Bd4 Re8 15. Qe1 Bf8 16. Qg3 Ng6 17. Bxf6 gxf6 18. Rg4 Qb6+ 19. Kh1 Qxb2 20. Rf1 Rxc3 21. Bd3 Rxc2 22. Bxc2 Qxc2 23. h4 h5',
        solution: '24. Rxg6+ fxg6,25. Qxg6+'),
    Puzzles(
        levelNumber: 6,
        pgn:
            '1. e4 c6 2. f4 d5 3. e5 e6 4. Nf3 c5 5. Be2 Nc6 6. O-O Nge7 7. d4 Nf5 8. dxc5 Bxc5+ 9. Kh1 O-O 10. Nc3 Bd7 11. Na4 Bb6 12. Nxb6 Qxb6 13. b3 Rac8 14. c4 Nfd4 15. Be3 dxc4 16. Bxd4 Nxd4 17. Qxd4 Qc7 18. Bxc4 a6 19. h3 Bc6 20. Ng5 Kh8 21. Qd3 g6 22. Qg3 b5 23. Bd3 Kg7 24. h4 Rcd8 25. Rfd1 h6 26. Ne4 Rd4 27. Nd6 h5 28. Rac1 Qb6 29. f5 Rg4 30. Qe1 Rxg2 31. Be4 Bxe4 32. Nxe4 Rxa2 33. fxg6 fxg6 34. Nf6 Qb7+ 35. Qe4 Qxe4+ 36. Nxe4 Rf4 37. Rd7+ Kh6 38. Nf6 Rxh4+ 39. Kg1 Rhh2 40. Rh7+ Kg5 41. Ne4+ Kh4 42. Rf7 Rhg2+ 43. Kf1 Rh2',
        solution: '44. Rf4+ Kh3,45. Rc3#'),
    Puzzles(
        levelNumber: 7,
        pgn:
            '1. e4 e5 2. Nf3 Nc6 3. Bc4 h6 4. Nc3 Nge7 5. d3 Ng6 6. O-O Bc5 7. Re1 a6 8. Be3 Bxe3 9. fxe3 O-O 10. Bb3 d6 11. Nd5 Na5 12. d4 Nxb3 13. cxb3 c6 14. Nb4 a5 15. Nd3 exd4 16. exd4 Bg4 17. Rc1 Qf6 18. Nf2 Bxf3 19. Qxf3 Qxd4 20. Rcd1 Qxb2 21. Rxd6 Qxa2 22. Rd7 Rab8 23. Ng4 Qb2 24. Rf1 Ne5 25. Nxe5 Qxe5 26. Rxf7 Rxf7 27. Qxf7+ Kh8 28. Qg6 Re8 29. Rf7 Qd4+ 30. Kf1 Qd1+ 31. Kf2 Qd2+ 32. Kg3 Qe3+ 33. Kh4 Qg5+ 34. Qxg5 hxg5+ 35. Kxg5 Rxe4 36. Rxb7 Re2 37. g3 Rxh2 38. Ra7 Rb2',
        solution: '39. Kg6 Rxb3,40. Ra8+ Rb8,41. Rxb8#'),
    Puzzles(
        levelNumber: 8,
        pgn:
            '1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. c3 Nf6 5. d4 exd4 6. cxd4 Bb4+ 7. Nc3 O-O 8. Bg5 Be7 9. Bd3 d6 10. h3 b6 11. O-O Bb7 12. a3 Ne8 13. Bd2 Nf6 14. Qc2 a6 15. e5 dxe5 16. dxe5 Nd7 17. Bxh7+ Kh8 18. Be4 Rb8 19. Bxc6 Bxc6 20. Rad1 Bxf3 21. gxf3 Bg5 22. Kh2 Bxd2 23. Rxd2 Qg5 24. Rg1 Qf4+ 25. Rg3 Nxe5 26. Nd5 Nxf3+ 27. Kg2 Qxd2 28. Qxd2 Nxd2 29. Rg5 Rbd8',
        solution: '30. Rh5+ Kg8,31. Ne7#'),
    Puzzles(
        levelNumber: 9,
        pgn:
            '1. b4 e6 2. Bb2 Nf6 3. b5 a6 4. c4 axb5 5. cxb5 Bc5 6. e3 d5 7. Nf3 O-O 8. Qc2 Bb6 9. Ng5 h6',
        solution: '10. Bxf6 hxg5,11. Bxd8'),
    Puzzles(
        levelNumber: 10,
        pgn:
            '1. c4 e6 2. Nf3 d5 3. e3 Nf6 4. Nc3 dxc4 5. Bxc4 Bd6 6. O-O O-O 7. e4 c6 8. e5 Bxe5 9. Nxe5 Qd4 10. Re1 b5 11. Bb3 b4 12. Nb1 Ba6 13. d3 Rd8 14. Qf3 Rd6 15. Bc4 Bb7 16. Qe3 Qh4 17. b3 Nbd7 18. Bb2 c5 19. Nxd7 Rxd7 20. Be5 Rad8 21. Nd2 Ng4 22. Qg3 Qg5 23. Bf4 Qf5 24. Ne4 h5 25. h3 Nf6 26. Nxf6+ Qxf6 27. Be5 Qh6 28. Re3 f6 29. Bb2 Bd5 30. Rae1 Bxc4 31. dxc4 e5 32. Bc1 Rd1 33. Kh2 Qh7 34. Qf3 Qc2 35. Rxd1 Rxd1 36. Qxh5 Rxc1 37. Qe8+ Kh7 38. Rg3 g5 39. Qf7+ Kh6 40. Qxf6+ Qg6 41. Qf8+ Qg7 42. Qd6+ Qg6 43. Qxe5 Rc2 44. Qxc5 Rxa2 45. Rd3 Qxd3 46. Qc6+ Kh5',
        solution: '47. g4+ Kh4,44. 8Qh6#')
  ];

  PuzzlesProvider() {
    levelCount = _puzzlesList.length;
  }

  int puzzlesCount() {
    return levelCount;
  }

  Puzzles getPuzzle(int index) {
    return _puzzlesList[index];
  }

  List<Puzzles> get getPuzzles {
    return _puzzlesList;
  }
}
