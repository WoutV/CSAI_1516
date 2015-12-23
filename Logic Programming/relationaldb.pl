0.7::plays_in("Dave Grohl", "Foo Fighters").
0.3::plays_in("Dave Grohl", "Nirvana").
0.88::plays_in("Kurt Cobain", "Nirvana").
0.8::plays_in("James Hetfield", "Metallica").

0.68::song(1, "Learn To Fly", "There Is Nothing Left To Lose").
0.28::song(2, "Learn To Fly", "Greatest Hits").
0.7::song(3, "Lithium", "Nevermind").
0.69::song(4, "Fade To Black", "Ride The Lightning").

0.95::album(1, 1984, "Metallica", "Ride The Lightning").
0.97::album(2, 1991, "Nirvana", "Nevermind").
0.92::album(3, 1999, "Foo Fighters", "There Is Nothing Left To Lose").
0.24::album(4, 2009, "Foo Fighters", "Greatest Hits").

list_songs_from_artist(Artist, SongTitle) :-
	plays_in(Artist, Band),
	song(_,SongTitle, Album),
	album(_,_,Band, Album).

query(list_songs_from_artist("Dave Grohl", _)).

album_artist(Artist, Album) :-
	plays_in(Artist, Band),
	album(_,_,Band, Album).

query(album_artist("Dave Grohl", "Nevermind")).
