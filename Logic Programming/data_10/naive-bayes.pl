% Prior probability
t(_)::topic(grain) ; t(_)::topic(interest) :- true.

% words
t(_)::weight(corn,t).
t(_)::weight(corn,f).
word(corn) :- topic(grain), weight(corn,t).
word(corn) :- topic(interest), weight(corn,f).

t(_)::weight(market,t).
t(_)::weight(market,f).
word(market) :- topic(grain), weight(market,t).
word(market) :- topic(interest), weight(market,f).

t(_)::weight(mln,t).
t(_)::weight(mln,f).
word(mln) :- topic(grain), weight(mln,t).
word(mln) :- topic(interest), weight(mln,f).

t(_)::weight(pct,t).
t(_)::weight(pct,f).
word(pct) :- topic(grain), weight(pct,t).
word(pct) :- topic(interest), weight(pct,f).

t(_)::weight(rate,t).
t(_)::weight(rate,f).
word(rate) :- topic(grain), weight(rate,t).
word(rate) :- topic(interest), weight(rate,f).

t(_)::weight(reuter,t).
t(_)::weight(reuter,f).
word(reuter) :- topic(grain), weight(reuter,t).
word(reuter) :- topic(interest), weight(reuter,f).

t(_)::weight(said,t).
t(_)::weight(said,f).
word(said) :- topic(grain), weight(said,t).
word(said) :- topic(interest), weight(said,f).

t(_)::weight(tonn,t).
t(_)::weight(tonn,f).
word(tonn) :- topic(grain), weight(tonn,t).
word(tonn) :- topic(interest), weight(tonn,f).

t(_)::weight(wheat,t).
t(_)::weight(wheat,f).
word(wheat) :- topic(grain), weight(wheat,t).
word(wheat) :- topic(interest), weight(wheat,f).

t(_)::weight(year,t).
t(_)::weight(year,f).
word(year) :- topic(grain), weight(year,t).
word(year) :- topic(interest), weight(year,f).
