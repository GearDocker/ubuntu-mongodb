name "wrapper"

description "The wrapper cookbook self contained config L100KL6TOYGHTQN8"

run_list "role[os-ubuntu-apt]", "role[ruby_attr]", "role[mongodb_attr]", "recipe[apt::default]", "recipe[mongodb::10gen_repo]", "recipe[mongodb::simple_install]"

