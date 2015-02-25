# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(title: "Who do you love?", content: "Richard loves Jenn");
Answer.create(title: "Who does she love?", content: "Jenn loves Richard", question_id: 1);
Answer.create(title: "She will be", content: "Loved", question_id: 1);