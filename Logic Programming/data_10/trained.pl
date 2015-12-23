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
0.999999999992::weight(corn).
topic(grain) :- word(corn), weight(corn).
topic(interest) :- word(corn), \+weight(corn).
0.636363636364::weight(market).
topic(grain) :- word(market), weight(market).
topic(interest) :- word(market), \+weight(market).
0.962962962963::weight(mln).
topic(grain) :- word(mln), weight(mln).
topic(interest) :- word(mln), \+weight(mln).
0.571428571429::weight(pct).
topic(grain) :- word(pct), weight(pct).
topic(interest) :- word(pct), \+weight(pct).
0.157894741691::weight(rate).
topic(grain) :- word(rate), weight(rate).
topic(interest) :- word(rate), \+weight(rate).
0.8::weight(reuter).
topic(grain) :- word(reuter), weight(reuter).
topic(interest) :- word(reuter), \+weight(reuter).
0.8::weight(said).
topic(grain) :- word(said), weight(said).
topic(interest) :- word(said), \+weight(said).
1.0::weight(tonn).
topic(grain) :- word(tonn), weight(tonn).
topic(interest) :- word(tonn), \+weight(tonn).
1.0::weight(wheat).
topic(grain) :- word(wheat), weight(wheat).
topic(interest) :- word(wheat), \+weight(wheat).
0.805555555556::weight(year).
topic(grain) :- word(year), weight(year).
topic(interest) :- word(year), \+weight(year).
