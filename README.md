# Тестовое задание для Seven Winds Studio

![](https://img.shields.io/badge/iOS-17%2B-green?logo=apple)
![](https://img.shields.io/badge/Swift%205.9-FA7343?style=flat&logo=swift&logoColor=white)

<div align="center">
    <img src="img/task.png" alt="AppIcon" height="200">
</div>

Приложение имеет сетевой слой и работает с API `http://147.78.66.203:3210`.
При входе токен в формате JWT сохраняется на диске. Токен хранится n-ое время и при входе в приложение проверяется его TTL, и, если нужно обновить токен, переходит в меню входа.
Приложение было написано на SwiftUI, что ускоряет работу с данными и верстку.
Для удобной работы с картами я использовал MapKit.
Перейти к кофейне можно через карту, нажав на пин, и через список, переключаясь через таббар. Выбранные кофе переходят в следующее окно.

<div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center; column-gap: 24px; row-gap: 20px;">
  <img src="img/1.png" style="width:200px;">
  <img src="img/2.png" style="width:200px;">
  <img src="img/3.png" style="width:200px;">
  <img src="img/4.png" style="width:200px;">
  <img src="img/5.png" style="width:200px;">
  <img src="img/6.png" style="width:200px;">
</div>

<div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center; column-gap: 24px; row-gap: 20px;">
  <img src="img/figma.png" style="max-width:700px;">
  <img src="img/swagger.png" style="width:200px;">
</div>

## Технологии и инструменты

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [Сетевой слой](https://habr.com/ru/articles/443514/)
- [Postman](https://www.postman.com/)
- [SwiftLint](https://github.com/realm/SwiftLint)
