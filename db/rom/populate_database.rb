#Users
UsersCreateRepo.create({email: 'gemorera@gmail.com'})
UsersCreateRepo.create({email: 'albert_heras@gmail.com'})
UsersCreateRepo.create({email: 'ivo@gmail.com'})

# Movies
MoviesCreateRepo.create(MoviesCreateRepo.changeset({ title: "a", plot: "aaa" }).map(:add_timestamps))
MoviesCreateRepo.create(MoviesCreateRepo.changeset({ title: "b", plot: "bb" }).map(:add_timestamps))
MoviesCreateRepo.create(MoviesCreateRepo.changeset({ title: "c", plot: "cc" }).map(:add_timestamps))
MoviesCreateRepo.create(MoviesCreateRepo.changeset({ title: "d", plot: "dd" }).map(:add_timestamps))

# First season
season_1 = SeasonsCreateRepo.create(SeasonsCreateRepo.changeset({ title: "s321", plot: "s321" }).map(:add_timestamps))
EpisodesCreateRepo.create(EpisodesCreateRepo.changeset({ title: "321", plot: "321", episode_number: 1 }).map(:add_timestamps).associate(season_1, :season))

# Second season
season_2 = SeasonsCreateRepo.create(SeasonsCreateRepo.changeset({ title: "numbers", plot: "just numbers" }).map(:add_timestamps))

EpisodesCreateRepo.create(EpisodesCreateRepo.changeset({ title: "1", plot: "p1", episode_number: '1' }).map(:add_timestamps).associate(season_2, :season))
EpisodesCreateRepo.create(EpisodesCreateRepo.changeset({ title: "2", plot: "p2", episode_number: '2' }).map(:add_timestamps).associate(season_2, :season))
EpisodesCreateRepo.create(EpisodesCreateRepo.changeset({ title: "3", plot: "p3", episode_number: '3' }).map(:add_timestamps).associate(season_2, :season))
EpisodesCreateRepo.create(EpisodesCreateRepo.changeset({ title: "4", plot: "p4", episode_number: '4' }).map(:add_timestamps).associate(season_2, :season))
EpisodesCreateRepo.create(EpisodesCreateRepo.changeset({ title: "5", plot: "p5", episode_number: '5' }).map(:add_timestamps).associate(season_2, :season))
####
