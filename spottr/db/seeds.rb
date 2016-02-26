User.create!([
  {email: "bruno@info.sec",password: "password"},
  {email: "tito@info.sec", password: "password"},
  {email: "javi@info.sec", password: "password"},
  {email: "lola@info.sec", password: "password"},
  {email: "lili@info.sec", password: "password"},
  {email: "lina@info.sec", password: "password"},
  {email: "yana@info.sec", password: "password"}
  
  
])

Profile.create!([
  {gender: "Male", first_name: "Bruno", last_name: "Stone", fitness_level: "Expert", gym: "Jailhouse", availability: "evening", user_id: 1, over_18: true, headshot_url: nil},
  {gender: "Male", first_name: "Tito", last_name: "puente", fitness_level: "Expert", gym: "Jailhouse", availability: "evening", user_id: 2, over_18: true, headshot_url: nil},
  {gender: "Male", first_name: "javi", last_name: "Rodriguez", fitness_level: "Expert", gym: "Jailhouse", availability: "evening", user_id: 3, over_18: true, headshot_url: nil},
  {gender: "Female", first_name: "Lola", last_name: "perez", fitness_level: "intermediate", gym: "Equinox", availability: "morning", user_id: 4, over_18: true, headshot_url: nil},
  {gender: "Female", first_name: "Lili", last_name: "kawasaki", fitness_level: "intermediate", gym: "Equinox", availability: "morning", user_id: 5, over_18: true, headshot_url: nil},
  {gender: "Female", first_name: "lina", last_name: "lempicka", fitness_level: "intermediate", gym: "Equinox", availability: "morning", user_id: 6, over_18: true, headshot_url: nil},
  {gender: "Female", first_name: "yana", last_name: "Ruski", fitness_level: "intermediate", gym: "Equinox", availability: "morning", user_id: 7, over_18: true, headshot_url: nil}
])
