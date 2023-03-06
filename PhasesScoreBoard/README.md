#  Таблица для подсчета результатов игры в 10 Фаз

_Этот проект был сделан для самого себя и друзей. Мы любим играть в "10 Фаз" и каждый раз приходится вести подсчеты результатов игры на бумаге, что не очень удобно. Я решил сделать приложение, которое будет учитывать собранные фазы, вести подсчет очков, набранных каждым игроком и заодно подсказывать какую фазу сейчас собирает каждый игрок и что это за фаза._

 
## Реализовано

1. Главный экран, на котором есть кнопка добавления нового игрока, отображение информации об игровой ситуации каждого игрока, кнопка начала новой игры
2. Кнопка добавления нового игрока. По нажатию на эту кнопку мы получаем всплывающее окно, в котором нужно добавить имя игрока (вся остальная информация заполняется "автоматически")
3. По мере добавления игроков на экране приложения появляется таблица, где для каждого игрока отображается Имя, Список Фаз с отметкой какие фазы уже собраны, Текущая фаза (то есть какую комбинацию карт игрок собирает сейчас, с "графической иллюстрацией фазы"), Счет игрока)
4. По нажатию на ячейку игрока мы переходим на экран записи результатов раунда. На этом экране есть Имя игрока, информация о том какую комбинацию карт он должен был собрать, чек-бокс для отметки собрана фаза или нет, информация о счете на данный момент, поле для ввода вновь набранных баллов. Кнопка "сохранить", при нажатии на которую информация о состоянии игрока передается на главный экран приложения (если фаза собрана - на главном экране появится новая комбинация, которую игрок должен собрать, изменяется счет игрока)
5. В нижней части экрана кнопка "новая игра", при нажатии на нее список игроков "обнуляется" и можно ввести новый список игроков и начать игру заново

## Не Реализовано

1. В первую очередь нужно подумать над графическим дизайном приложения. 
2. Можно подумать над тем, чтобы отражать кто побеждает в игре на данный момент (но пока не очень для самого себя представляю как бы я хотел это видеть и только поэтому не реализовал)
3. Пока не реализована возможность сохранения прерванной игры (просто в голову не приходило, что такое может понадобиться, но вот понадобилось)


## UPD 22/01/2023
1. Добавил иконку
2. Поправил работу приложения в дневном/ночном режиме
3. Добавил показ статистики по очкам (то есть видно какие очки игрок набирал в течение игры)
