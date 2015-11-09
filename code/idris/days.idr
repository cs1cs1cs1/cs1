module days

data days = monday | tuesday | wednesday | thursday | friday | saturday | sunday

nextDay: days -> days
nextDay monday = tuesday
nextDay tuesday = wednesday
nextDay wednesday = thursday
nextDay thursday = friday
nextDay friday = saturday
nextDay saturday = sunday
nextDay _ = monday

nextWeekday: days -> days
nextWeekday friday = monday
nextWeekday saturday = monday
nextWeekday d = (nextDay d) 
