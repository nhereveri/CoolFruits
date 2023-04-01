# CoolFruits Challenge

Un amigo muy cercano a ti contrató una empresa para que le desarrollara una pequeña aplicación para ver una lista de frutas, le entregaron el producto y te pide que lo ayudes a revisar la calidad del código asi como también hacer las mejoras que consideres necesarias para tener un código con los mejores estandares de calidad.

* Puedes hacer tantos cambios como consideres necesarios para tener un código que a tu criterio tenga buenas prácticas.
* No hacen falta hacer cambios visuales, ni añadir funcionalidades nuevas para el usuario.
* Debes subir este proyecto a un repositorio y compartirlo con nosotros cuando estén listo.
* Los tests unitarios quedan a tu criterio.

En caso de cualquier duda o inconveniente estoy para ayudarte lalejzapata@falabella.cl, saludos!

## Comentarios

- Existen muchos principios SOLID y DRY que no se respetaban. Mayormente fueron los de "Separar las responsabilidades", "Abierto a extensión, cerrado a modificación" e "Inyección de dependencias". Por lo general se utilizan protocolos para solucionar la mayor parte de estos problemas.
- Un par de secciones críticas necesitan un control de concurrencia. Se ha escogido NSLock en lugar de DispatchQueue, ya que se conoce la porción de código con potenciales errores.
- Se añadieron algunos test unitarios. Principalmente asociados al modelo o formatos de presentación de texto. No se crearon test de interfaces, ya que requerian una inyección de dependencia algo larga de implementar.
- Se organiza el código fuente para cubrir un poco de Clean y MVVM.
