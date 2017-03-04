This is the first time I used [ROM](rom-rb.org) so provably I have not applied its bets practices.

This API has 4 simple endpoints:
* `GET '/movies'`  - Retrives all movies.
* `GET '/seasons'` - Retrives all seasons with its episodes.
* `GET '/'` - Retrives the catalog.
* `GET '/library'` - Retrives last 3 days purchased movies & seasons.
* `POST '/purchase'` - Performs a pruchase. i.e `curl --data "user_id=1&video_quality=2&season_id=1" http://localhost:4561/purchase`


To run the server:

`rackup -p 4561`
