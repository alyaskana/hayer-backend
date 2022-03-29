# ===== RESET DATABASE ======
Post.destroy_all
User.destroy_all
AdType.destroy_all

# ===== CREATE AD TYPES ======

def create_ad_types() 
  [
    AdType.create!(name: "Работа", key: "work"),
    AdType.create!(name: "Учеба", key: "study"),
    AdType.create!(name: "Ивенты", key: "events")
  ]
end

ad_types = create_ad_types()


# ===== CREATE USERS =====

user_alina = User.create!({
  first_name: "Алина",
  last_name: "Бычкова",
  link: "https://t.me/alyaskana",
  about: "Умею делать фронтенд, пить пиво в ровеснике и ремонт",
  email: "aabychkova_4@edu.hse.ru",
  personal_email: "ialina240200@gmail.com",
  password: "123456",
  interests: ['фронтенд', 'пиво', 'веб'],
  avatar: File.open(File.join(Rails.root, "/app/assets/images/avatars/alina.jpeg"))
})

user_sasha = User.create!({
  first_name: "Саша",
  last_name: "Барабонова",
  link: "https://t.me/abarabonova",
  about: "Я саша продуктовая дизайнерка приколистка подписывайтесь на мой смешной + красивый инстаграм",
  email: "adbarabonava@edu.hse.ru",
  personal_email: "abarabonovad@gmail.com",
  password: "123456",
  interests: ['пиво', 'дизайн', 'веб'],
  avatar: File.open(File.join(Rails.root, "/app/assets/images/avatars/sasha.jpeg"))
})

user_tolya = User.create!({
  first_name: "Толя",
  last_name: "Никифоров",
  link: "https://t.me/tnikzzz",
  about: "Сладкий, как сахар, крепкий, как виски.",
  email: "avnikiforov_4@edu.hse.ru",
  personal_email: "tniksnikiforov@gmail.com",
  password: "123456",
  interests: ['музыка', 'дизайн', 'веб'],
  avatar: File.open(File.join(Rails.root, "/app/assets/images/avatars/alina.jpeg"))
})

# ===== CREATE POSTS =====

posts = [
  user_alina.posts.create!({
    title: "Разработчик мобильных приложений IOS",
    description: "Нужно запилить небольшую фичу для проекта, мы занимаемся разработкой приложения для коммуникации. Нужно реализовать возможность поиска по ключевым словам среди названий объявлений.
    Мы пишем на React Native. Сейчас реализован весь функционал аппки, кроме поиска. Дедлайн 28 декабря. Готовы заплатить.",
    deadline: Time.now + 14.days,
    ad_types: ad_types.sample(2),
    format: Post.formats.values.sample,
    responses: [
      user_tolya.responses.new({
        description: "привет! есть три реализованных проекта — аппка на нейронке, трекер и игра. с поисокм работал, за пару дней сделаю.",
        link: "https://t.me/tnikzzz"
      }),
      user_sasha.responses.new({
        description: "привет, могу помочь на этих выходных, если еще будет актуально",
        link: "https://t.me/alyaskana"
      })
    ]
  }),
  user_sasha.posts.create!({
    title: "Помочь с визуалкой по истории искусства",
    description: "Дедлайн через три дня, а я так и не начал работу и понятия не имею, что там вообще делать надо, т.к. на пары не ходил. Надо стандартную визуалку, на 30-50 слайдов, на минимальный балл. По бартеру могу сайт сделать например, или лендос на редимаге.",
    deadline: Time.now + 3.days,
    ad_types: ad_types.sample(2),
    format: Post.formats.values.sample,
    responses: [
      user_alina.responses.new({
        description: "привет, могу помочь на этих выходных, если еще будет актуально",
        link: "https://t.me/alyaskana"
      })
    ]
  }), 
  user_tolya.posts.create!({
    title: "Верстка сайта",
    description: "Кто готов для людей искусства помочь с версткой сайта? Нужна простая админка для добавления статей и редактирования текстов. Бюджет у них 40000. Сроки до февраля.",
    deadline: Time.now + 5.days,
    ad_types: ad_types.sample(2),
    format: Post.formats.values.sample,
    responses: [
      user_sasha.responses.new({
        description: "давай попробуем списаться через пару дней, я как раз делаю похожую штуку и могу подсказать пару вещей",
        link: "https://t.me/abarabonova"
      })
    ]
  }),
  user_sasha.posts.create!({
    title: "Визуальное исследование по теме гендерной истории искусства",
    description: "К 20 января нужно написать визуальное исследование на 40 слайдов на тему «Исследование творчества амазонок русского авангарда», вам нужно собрать макет и оформить список литературы по госту",
    deadline: Time.now + 6.days,
    ad_types: ad_types.sample(3),
    format: Post.formats.values.sample
  }),
  user_tolya.posts.create!({
    title: "Собрать презентацию для питча",
    description: "18 декабря выступаем на финале конкурса Вышки с презентацией стартапа. У нас есть вся информация, нам нужна красивая презентация, референсы есть, заплатим и поможем если что.",
    deadline: Time.now + 1.days,
    user: user_tolya,
    ad_types: ad_types.sample(1),
    format: Post.formats.values.sample
  })
]


# ===== FOLLOWING =====

user_alina.followings << user_sasha
user_sasha.followings << user_alina