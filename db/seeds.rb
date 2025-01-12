# Sunday
RecurrentEvent.create(
  name: "Siege Fight",
  hour: 16,
  week_day: 1,
  type: "siege_fight",
  bonification_value: 800,
  bonification_type: "thundercoins"
)
RecurrentEvent.create(
  name: "Boss Prime Time",
  hour: 20,
  week_day: 1,
  type: "booss_prime_time",
  bonification_value: 200,
  bonification_type: "thundercoins"
)

# Monday
RecurrentEvent.create(
  name: "Boss Prime Time",
  hour: 20,
  week_day: 2,
  type: "booss_prime_time",
  bonification_value: 200,
  bonification_type: "thundercoins"
)
RecurrentEvent.create(
  name: "BoonStone Defense",
  hour: 21,
  week_day: 2,
  type: "boonstone_defense",
  bonification_value: 300,
  bonification_type: "thundercoins"
)

# Tuesday
RecurrentEvent.create(
  name: "Boss Prime Time",
  hour: 20,
  week_day: 3,
  type: "booss_prime_time",
  bonification_value: 200,
  bonification_type: "thundercoins"
)
RecurrentEvent.create(
  name: "RiftStone Defense",
  hour: 21,
  week_day: 3,
  type: "riftstone_defense",
  bonification_value: 500,
  bonification_type: "thundercoins"
)

# Wednesday
RecurrentEvent.create(
  name: "ArchBoss Alliance Time",
  hour: 20,
  week_day: 4,
  type: "archboss_alliance_time",
  bonification_value: 400,
  bonification_type: "thundercoins"
)

# Thursday
RecurrentEvent.create(
  name: "Boss Prime Time",
  hour: 20,
  week_day: 5,
  type: "booss_prime_time",
  bonification_value: 200,
  bonification_type: "thundercoins"
)

# Friday
RecurrentEvent.create(
  name: "BoonStone Defense",
  hour: 21,
  week_day: 6,
  type: "boonstone_defense",
  bonification_value: 300,
  bonification_type: "thundercoins"
)
RecurrentEvent.create(
  name: "Boss Prime Time",
  hour: 20,
  week_day: 6,
  type: "booss_prime_time",
  bonification_value: 200,
  bonification_type: "thundercoins"
)

# Saturday
RecurrentEvent.create(
  name: "RiftStone Defense",
  hour: 21,
  week_day: 7,
  type: "riftstone_defense",
  bonification_value: 500,
  bonification_type: "thundercoins"
)
RecurrentEvent.create(
  name: "ArchBoss Alliance Time",
  hour: 20,
  week_day: 7,
  type: "archboss_alliance_time",
  bonification_value: 400,
  bonification_type: "thundercoins"
)

start_date = DateTime.parse("12-01-2025")
end_date = start_date + 6.days
WeeklySchedule.create(start_at: start_date, end_at: end_date)
