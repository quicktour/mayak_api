# Маяк API тестовое задание

##### Запуск приложения
* Для сборки приложения введите команду `make build`
* Для запуска приложение введите команду `make run` 

Приложение становится доступным по адресу `http://localhost:3000`

###### Endpoints
`http://localhost:3000/api/v1/cards/list` - список всех карточек в базе
```
{
    "cards": [
        {
            "id": 1,
            "imt_id": 19400835,
            "product_name": "Колготки",
            "created_at": "2021-07-05T16:39:51.373Z",
            "updated_at": "2021-07-05T16:39:51.373Z"
        },
        ...
    ]
}
```

`http://localhost:3000/api/v1/cards/top` - топ 10 карточек за неделю по комментариям
```
{
    "cards": [
        {
            "imt_id": 19400834,
            "total_comments": 29
        },
        {
            "imt_id": 19400811,
            "total_comments": 2
        },
        ...
    ]
}
```

`http://localhost:3000/api/v1/feedbacks/:imt_id/chart` - данные для графика активности
```
{
    "chart": {
        "labels": [
            "Jul 02",
            "Jun 24",
            "Jun 21",
            "Jun 10",
            "Jun 06"
        ],
        "data": [
            1,
            1,
            1,
            1,
            1
        ]
    }
}
```

##### Тестирование приложения
* Для тестирование приложения запустите команду `make test`
* Для запуска отдельного теста `make test path='./spec/models/card_spec.rb'`

##### Остановка приложения
* Что бы остановить приложение и удалить контейнеры запустите командку `make stop`
