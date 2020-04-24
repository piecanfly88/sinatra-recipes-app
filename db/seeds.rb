chef = User.create(username: "Chef", email: "chef@chef.com", password: "password")

Recipe.create(title: "Chicken Parm", ingredients: "1lb chicken, 1 cup marinara sauce, 1/3 cup parm cheese, 1/2 cup bread crumbs, 1 tablespoon chopped parsley, 1 egg, 1/4 cup flour", instructions: "instructions to be added at later date", user_id: chef.id)