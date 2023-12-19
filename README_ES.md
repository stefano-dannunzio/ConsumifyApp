# Consumify

Consumify es una aplicación de música creada con Flutter.

## Características

- Lista de canciones: Muestra una lista de canciones que se pueden reproducir.
- Artistas: Muestra una lista de artistas y permite filtrar las canciones por artista.

## Cómo usar

1. Clona el repositorio.
2. Abre el proyecto en tu editor de código favorito.
3. Ejecuta la aplicación.

## Estructura del proyecto

- `lib`: Contiene el código fuente de la aplicación.
 - `screens`: Contiene las pantallas de la aplicación.
  - `artist_screen.dart`: Pantalla que muestra los artistas.
  - `home_screen.dart`: Pantalla de inicio.
  - `main_screen.dart`: Pantalla principal que muestra la lista de canciones y los artistas.
  - `single_song_screen.dart`: Pantalla que muestra la información de una canción en particular.
  - `songlist_screen.dart`: Pantalla que muestra la lista de canciones.
 - `themes`: Contiene los temas de la aplicación.
  - `app_themes.dart`: Define el tema de la aplicación.
 - `utilities`: Contiene funcionalidades de la aplicación.
  - `songs_loader.dart`: Utilidad que carga las canciones ubicadas en el archivo ubicado en assets/JSONS/songs.json.
 - `widgets`: Contiene los widgets personalizados de la aplicación.
  - `song_card.dart`: Contiene la Card personalizada en la cual se muestra cada cancion en la SonglistScreen.
- `pubspec.yaml`: Define las dependencias del proyecto.
- `README_ES.md`: Este archivo.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT.
