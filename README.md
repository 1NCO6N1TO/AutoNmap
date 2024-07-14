# 🛠️ AutoNmap

Este script de Bash valida una dirección IP ingresada y realiza un escaneo de puertos utilizando `nmap`. Los mensajes de estado y error están mejorados con colores para mayor claridad. Fue creado con el objetivo de automatizar los escaneos de puertos y versiones/servicios utilizando `nmap`.

## 🚀 Características

- **Validación de IP:** Verifica si la IP es válida y si los octetos están en el rango de 0 a 255.
- **Escaneo de Puertos:** Escanea todos los puertos abiertos y extrae información detallada.
- **Escaneo de Versiones y Servicios:** Realiza un escaneo detallado de los servicios y versiones en los puertos abiertos.
- **Mensajes de Estado:** Coloreados para una mejor legibilidad y comprensión.

## 📋 Requisitos

- `nmap` instalado
- Permisos de superusuario (sudo)

## 📦 Instalación

Clona este repositorio y navega hasta el directorio:

```bash
git clone https://github.com/1NCO6N1TO/AutoNmap.git
cd port-scanner
```

## 🛠️ Uso

Ejecuta el script con una dirección IP como argumento:

```bash
sudo ./port_scanner.sh 192.168.1.1
```
## 📜 Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Por favor, abre un *issue* o envía un *pull request*.

## 🧑‍💻 Autor

- **1NCO6N1TO** - [GitHub](https://github.com/1NCO6N1TO)

