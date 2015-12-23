0.797872340426::topic(grain); 0.202127659574::topic(interest) <- true.
0.32::weight(corn,t).
0.0::weight(corn,f).
word(corn) :- topic(grain), weight(corn,t).
word(corn) :- topic(interest), weight(corn,f).
0.28::weight(market,t).
0.631578645558::weight(market,f).
word(market) :- topic(grain), weight(market,t).
word(market) :- topic(interest), weight(market,f).
0.346666666667::weight(mln,t).
0.052631899137::weight(mln,f).
word(mln) :- topic(grain), weight(mln,t).
word(mln) :- topic(interest), weight(mln,f).
0.266666666667::weight(pct,t).
0.789473370003::weight(pct,f).
word(pct) :- topic(grain), weight(pct,t).
word(pct) :- topic(interest), weight(pct,f).
0.04::weight(rate,t).
0.842104976292::weight(rate,f).
word(rate) :- topic(grain), weight(rate,t).
word(rate) :- topic(interest), weight(rate,f).
0.906666666667::weight(reuter,t).
0.894736578135::weight(reuter,f).
word(reuter) :- topic(grain), weight(reuter,t).
word(reuter) :- topic(interest), weight(reuter,f).
0.853333333333::weight(said,t).
0.842105044153::weight(said,f).
word(said) :- topic(grain), weight(said,t).
word(said) :- topic(interest), weight(said,f).
0.466666666667::weight(tonn,t).
0.0::weight(tonn,f).
word(tonn) :- topic(grain), weight(tonn,t).
word(tonn) :- topic(interest), weight(tonn,f).
0.506666666667::weight(wheat,t).
0.0::weight(wheat,f).
word(wheat) :- topic(grain), weight(wheat,t).
word(wheat) :- topic(interest), weight(wheat,f).
0.386666666667::weight(year,t).
0.368420948007::weight(year,f).
word(year) :- topic(grain), weight(year,t).
word(year) :- topic(interest), weight(year,f).

% WORDS
%%% QUERY %%%

word(pct).
word(rate).
word(bank).
query(topic(interest)). % correct.
query(topic(grain)). % incorrect.
