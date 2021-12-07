User.destroy_all
Post.destroy_all

user_alina = User.create!({
  first_name: "Алина",
  last_name: "Бычкова",
  link: "https://t.me/alyaskana",
  about: "Лушая девочка во вселенной, идеальный фронтендер, душа компании, мизантроп, интроверт и просто красавица",
  email: "aabychkova_4@edu.hse.ru",
  personal_email: "ialina240200@gmail.com"
})

user_sasha = User.create!({
  first_name: "Саша",
  last_name: "Барабонова",
  link: "https://t.me/abarabonova",
  about: "Саня, ты в порядке? Ты в порядке, Саня?",
  email: "adbarabonava@edu.hse.ru",
  personal_email: "abarabonovad@gmail.com"
})

user_tolya = User.create!({
  first_name: "Толя",
  last_name: "Никифоров",
  link: "https://t.me/tnikzzz",
  about: "Сладкий, как сахар, крепкий, как виски.",
  email: "avnikiforov_4@edu.hse.ru",
  personal_email: "tniksnikiforov@gmail.com"
})

Post.create!({
  title: "Разработчик мобильных приложений IOS",
  description: "Нужно запилить небольшую фичу для проекта, мы занимаемся разработкой приложения для коммуникации. Нужно реализовать возможность поиска по ключевым словам среди названий объявлений.
  Мы пишем на React Native. Сейчас реализован весь функционал аппки, кроме поиска. Дедлайн 28 декабря. Готовы заплатить.",
  user: user_sasha,
})

Post.create!({
  title: "Помочь с визуалкой по истории искусства",
  description: "Дедлайн через три дня, а я так и не начал работу и понятия не имею, что там вообще делать надо, т.к. на пары не ходил. Надо стандартную визуалку, на 30-50 слайдов, на минимальный балл. По бартеру могу сайт сделать например, или лендос на редимаге.",
  user: user_alina,
})

Post.create!({
  title: "Верстка сайта",
  description: "Кто готов для людей искусства помочь с версткой сайта? Нужна простая админка для добавления статей и редактирования текстов. Бюджет у них 40000. Сроки до февраля.",
  user: user_tolya,
})

user_alina.followings << user_sasha
user_sasha.followings << user_alina