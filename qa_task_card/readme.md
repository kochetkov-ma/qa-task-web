Тест дизайн
---

## Протестировать Web приложение 

Имеется приложение (только Frontend)

- Есть поле ввода `Номер карты`
- Есть кнопка `Проверить номер карты`

### Требования
- В поле можно вводить от `0` до `16` любых символов
- По клику на кнопку `Проверить номер карты` проверяются введенные символы
  - Если введенные символы соответствуют требованиям, тогда появляется сообщение `Валидный номер`
    - 16 цифр (от 0 до 9)
    - номер должен соответствовать `Алгоритму Луна`
  - Если введенные символы **НЕ** соответствуют требованиям, тогда появляется сообщение красного цвета `Невалидный номер`

### Задание

1. Найти в Интернете и изучить `Алгоритм Луна`, по которому определяется корректность номера карты
2. Согласно различным техникам тест дизайна составить набор сценариев для проверки требований к этому приложению
3. Структура сценариев должна быть оформлена по канонам Тестирования
4. Избежать лишних сценариев

## Найти **один** дефект

В приложении найти дефект основываясь на имеющихся требованиях.

Описать дефект согласно канонам Тестирования, приложить максимальное кол-во информации

## Найти **одну** недоработку в дизайне или функциональности

В приложении найти проблему основываясь на нефункциональных требованиях (которые нужно предположить самому) и пользовательском опыте.

Описать проблему аналогично Дефекту