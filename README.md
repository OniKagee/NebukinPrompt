# NebukinPrompt (Nebukin Petr Operating System)
Проект ученика ГБОУ Школы №2025 по информатике на тему "Возможности BIOS"

  

## Как выглядит

![Фотографии с интерфейсом NebukinPrompt](https://telegra.ph/file/056e07e92c276b5c43630.jpg)

## Минимальные требования для запуска на ПК
- Полное отсутсвие UEFI;
- 1 МБ ОЗУ и видеопамяти;
- Дискета, USB Flash, CD/DVD диск и любой другой накопитель, вмещающий 1440 КБ (1,44 МБ).

## Сборка
1. Форкни этот проект (понадобится учётная запись GitHub);
2. Перейди в форкнутый репозиторий, выбери Actions;
3. Нажми на __osbuild__, а затем __Run workflow__.
  

Готово! Теперь зайди в папку __disk_images__ и скачай собранную систему!

## Запуск системы на реальном ПК
1. Скачай и установи утилиту [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/files/latest/download);
2. Загрузи [последнюю версию ОС в формате *.flp](https://github.com/PetrNebukin/NebukinPrompt/raw/main/disk_images/nebukinprompt.flp);
3. Запусти Win32DiskImager и делай всё, как на фото:
  
  
![Окно программы Win32DiskImager с выделением нужных кнопок](https://telegra.ph/file/e88db4a9b55cd0fa55f3d.png)

4. Перезагружай ПК и грузись с устройства, на которое ты ранее записал образ ОС.
  
  
Готово!

## Запуск системы c помощью Bochs (Windows)
1. [Скачай](https://github.com/PetrNebukin/NebukinPrompt/raw/main/emulator/bochs.zip) и распакуй Bochs;
2. Загрузи [последнюю версию ОС в формате *.flp](https://github.com/PetrNebukin/NebukinPrompt/raw/main/disk_images/nebukinprompt.flp) и закинь в папку, куда ранее ты распаковал Bochs;
3. Запусти ОС, открыв приложение __boot.bat__

  

Готово!
