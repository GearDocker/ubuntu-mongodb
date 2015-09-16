name "wrapper"

description "The wrapper cookbook self contained config EK1774INEBA1R5FJ"

run_list "role[os-ubuntu-apt]", "role[ruby_attr]", "role[mongodb_attr]", "recipe[apt::default]", "recipe[mongodb::10gen_repo]", "recipe[mongodb::simple_install]"

