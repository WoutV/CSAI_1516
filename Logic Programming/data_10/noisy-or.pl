0.5::word(corn).
0.5::word(market).
0.5::word(mln).
0.5::word(pct).
0.5::word(rate).
0.5::word(reuter).
0.5::word(said).
0.5::word(tonn).
0.5::word(wheat).
0.5::word(year).


0.001::leak(grain).
0.001::leak(interest).
topic(grain) :- \+word(X), leak(grain).
topic(interest) :- \+word(X), leak(interest).


% YOUR MODEL
t(_)::weight(corn).
topic(grain) :- word(corn), weight(corn).
topic(interest) :- word(corn), \+weight(corn).
t(_)::weight(market).
topic(grain) :- word(market), weight(market).
topic(interest) :- word(market), \+weight(market).
t(_)::weight(mln).
topic(grain) :- word(mln), weight(mln).
topic(interest) :- word(mln), \+weight(mln).
t(_)::weight(pct).
topic(grain) :- word(pct), weight(pct).
topic(interest) :- word(pct), \+weight(pct).
t(_)::weight(rate).
topic(grain) :- word(rate), weight(rate).
topic(interest) :- word(rate), \+weight(rate).
t(_)::weight(reuter).
topic(grain) :- word(reuter), weight(reuter).
topic(interest) :- word(reuter), \+weight(reuter).
t(_)::weight(said).
topic(grain) :- word(said), weight(said).
topic(interest) :- word(said), \+weight(said).
t(_)::weight(tonn).
topic(grain) :- word(tonn), weight(tonn).
topic(interest) :- word(tonn), \+weight(tonn).
t(_)::weight(wheat).
topic(grain) :- word(wheat), weight(wheat).
topic(interest) :- word(wheat), \+weight(wheat).
t(_)::weight(year).
topic(grain) :- word(year), weight(year).
topic(interest) :- word(year), \+weight(year).
