# Sedaweb Dynamic Progress OS

Это версия сайта с динамическими логами:

- `index.html` — главная
- `logs.html` — публичная страница логов
- `admin.html` — форма добавления логов
- `setup.html` — настройка Supabase
- `supabase-config.js` — подключение Supabase
- `supabase-schema.sql` — SQL для создания таблицы и правил доступа

## Быстрый запуск

1. Загрузи файлы в корень репозитория GitHub Pages.
2. Создай проект в Supabase.
3. Открой Supabase → SQL Editor → New query.
4. Вставь содержимое `supabase-schema.sql`.
5. Нажми Run.
6. В Supabase открой Project Settings → API.
7. Скопируй Project URL и anon public key.
8. Открой на сайте `setup.html`.
9. Вставь Project URL и anon public key.
10. Нажми сохранить.
11. Открой `admin.html`.
12. В поле Admin key введи: `seda-secret-write-key-2026`.
13. Добавь первый лог.
14. Открой `logs.html`.

## Важно

Файл `supabase-schema.sql` не надо загружать в публичный репозиторий после выполнения, потому что внутри указан admin key.
