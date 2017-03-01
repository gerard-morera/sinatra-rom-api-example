config = ROM::Configuration.new(:sql, "sqlite::Memory")

run_migrations(config)

config.register_relation Movies::Relation
config.register_relation Seasons::Relation
config.register_relation Episodes::Relation
config.register_relation Users::Relation
config.register_relation Purchases::Relation

container = ROM.container(config)


SeasonsCreateRepo  = Seasons::Repositories::Create.new(container)
SeasonsGetRepo     = Seasons::Repositories::Get.new(container)

EpisodesCreateRepo = Episodes::Repositories::Create.new(container)
EpisodesGetRepo    = Episodes::Repositories::Get.new(container)

MoviesCreateRepo = Movies::Repositories::Create.new(container)
MoviesGetRepo    = Movies::Repositories::Get.new(container)

UsersGetPurchaseBytTimeContrainRepo = Users::Repositories::Purchases::GetByTimeContrain.new(container)
UsersCreateRepo = Users::Repositories::Create.new(container)
UsersGetRepo    = Users::Repositories::Get.new(container)

PurchasesCreateRepo = Purchases::Repositories::Create.new(container)
PurchasesGetRepo    = Purchases::Repositories::Get.new(container)

