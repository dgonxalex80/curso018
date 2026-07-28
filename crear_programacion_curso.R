library(writexl)

fechas <- as.Date(c(
  "2020-08-05","2020-08-07","2020-08-12","2020-08-14","2020-08-19","2020-08-21",
  "2020-08-26","2020-08-28","2020-09-02","2020-09-04","2020-09-09","2020-09-11",
  "2020-09-23","2020-09-25","2020-09-30","2020-10-02","2020-10-07","2020-10-09",
  "2020-10-14","2020-10-16","2020-10-21","2020-10-23","2020-10-28","2020-10-30",
  "2020-11-04","2020-11-06","2020-11-11","2020-11-13","2020-11-18","2020-11-20",
  "2020-11-25","2020-11-27"
))

semana_cal <- c(1,1,2,2,3,3,4,4,5,5,6,6,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17)
semana_doc <- c(1:6, rep(NA, 0))
semana_doc <- rep(NA_integer_, 32)
semana_doc[1:12] <- rep(1:6, each=2)
semana_doc[13:32] <- rep(7:16, each=2)

modulo <- c(rep("Módulo 1. Analiza tus datos", 6),
            rep("Módulo 2. Mide la incertidumbre", 4),
            rep("Módulo 3. Conoce los modelos estadísticos", 14),
            rep("Módulo 4. Generaliza resultados e hipótesis", 6),
            rep("Módulo 5. Aplica lo aprendido", 2))

tema <- c(
  "Metodología estadística, tipos de estudio, población, muestra, unidad de análisis y variables",
  "Bases de datos: calidad, codificación, escalas de medición y planteamiento de una pregunta de negocio",
  "Tablas de frecuencia y visualización univariada para variables cualitativas y cuantitativas",
  "Indicadores de tendencia central y su interpretación contextual",
  "Dispersión, posición y detección de valores atípicos; integración del análisis univariado",
  "Análisis bivariado: tablas cruzadas, frecuencias condicionales, dispersión y correlación",
  "Experimento aleatorio, espacio muestral, eventos, enfoques y axiomas de probabilidad",
  "Técnicas de conteo, reglas de unión e intersección y diagramas de Venn",
  "Probabilidad condicional, independencia, árboles y teorema de Bayes",
  "Primera evaluación: módulos 1 y 2",
  "Variable aleatoria discreta, función de probabilidad y función acumulada",
  "Esperanza, varianza y desviación estándar; decisiones bajo incertidumbre",
  "Distribuciones conjuntas, marginales y condicionales; independencia y covarianza",
  "Combinaciones lineales de variables aleatorias y uso de simulación",
  "Modelo Bernoulli y modelo binomial: condiciones, cálculo e interpretación",
  "Modelo Poisson: tasas, conteos y aproximaciones",
  "Variables continuas, densidad y probabilidad acumulada",
  "Distribución uniforme y exponencial en tiempos y procesos",
  "Distribución normal: estandarización, percentiles y probabilidades",
  "Uso de software para seleccionar, calcular y validar modelos probabilísticos",
  "Comparación de modelos y resolución de un caso integrador de mercadeo/negocios",
  "Taller de síntesis: selección de modelo, supuestos e interpretación gerencial",
  "Laboratorio y retroalimentación del módulo 3; avance analítico del proyecto",
  "Segunda evaluación: módulo 3",
  "Muestreo probabilístico y no probabilístico; sesgo y representatividad",
  "Estimación puntual, error estándar, teorema del límite central y distribuciones muestrales",
  "Intervalos de confianza para media y proporción; interpretación para decisiones",
  "Hipótesis, errores tipo I y II, valor p y procedimiento de contraste",
  "Pruebas para una y dos medias/proporciones; comunicación de conclusiones",
  "Introducción y estimación del modelo de regresión lineal simple",
  "Validación, correlación, prueba F, predicción y presentación del proyecto aplicado",
  "Examen final: módulos 4 y 5; cierre y comunicación de aprendizajes"
)

objetivo <- c(
  "Reconocer los elementos de la metodología estadística y formular un problema susceptible de análisis.",
  "Preparar información válida y relacionar variables con una pregunta de decisión.",
  "Resumir e interpretar datos mediante tablas y gráficos pertinentes.",
  "Calcular y justificar el indicador de centro apropiado para una situación.",
  "Comparar grupos usando variabilidad, posición y evidencia gráfica.",
  "Interpretar asociaciones sin confundir correlación con causalidad.",
  "Representar incertidumbre mediante eventos y reglas básicas de probabilidad.",
  "Construir espacios muestrales y calcular probabilidades con estrategias de conteo.",
  "Actualizar probabilidades con información condicionante y valorar independencia.",
  "Demostrar comprensión integrada y argumentada de estadística descriptiva y probabilidad.",
  "Modelar resultados aleatorios discretos y leer sus funciones.",
  "Cuantificar el resultado esperado y el riesgo de una decisión.",
  "Analizar dos variables aleatorias y evaluar dependencia.",
  "Obtener e interpretar media y varianza de resultados agregados.",
  "Reconocer y aplicar el modelo binomial en problemas empresariales.",
  "Aplicar Poisson a eventos por intervalo y evaluar sus supuestos.",
  "Distinguir densidad de probabilidad y calcular probabilidades continuas.",
  "Aplicar modelos uniforme y exponencial a procesos y tiempos de espera.",
  "Usar el modelo normal para probabilidades, puntos de corte y comparación.",
  "Procesar datos con software y verificar resultados y supuestos.",
  "Elegir el modelo probabilístico que responde mejor a una situación.",
  "Resolver y comunicar un problema completo de modelos estadísticos.",
  "Consolidar el módulo con evidencia reproducible y retroalimentación.",
  "Demostrar dominio del módulo 3 mediante selección, cálculo e interpretación de modelos.",
  "Diseñar o evaluar una estrategia de muestreo coherente con el problema.",
  "Comprender la variabilidad muestral y diferenciar estimador de parámetro.",
  "Estimar parámetros y expresar incertidumbre de forma útil para decidir.",
  "Formular y evaluar hipótesis estadísticas comprendiendo los riesgos de error.",
  "Contrastar parámetros y comunicar alcance práctico y estadístico.",
  "Estimar e interpretar una relación lineal orientada a explicación y predicción.",
  "Validar el modelo, comunicar hallazgos y sustentar una recomendación basada en datos.",
  "Integrar inferencia y aplicación para sustentar decisiones y reflexionar sobre el aprendizaje."
)

antes <- c(
  "Leer guía 1.1 y explorar una noticia con datos; identificar pregunta, población y variables.",
  "Revisar guía de bases de datos y descargar/inspeccionar la base del caso.",
  "Ver recurso sobre tipos de variables; intentar una tabla y un gráfico.",
  "Resolver preguntas diagnósticas sobre media, mediana y moda.",
  "Revisar cuartiles, rango, varianza y desviación; llevar resultados del caso.",
  "Leer guía de análisis bivariado y formular dos hipótesis de asociación.",
  "Revisar conjuntos y vocabulario de experimentos aleatorios.",
  "Estudiar reglas de suma/producto y resolver ejercicios de conteo.",
  "Preparar un árbol y una tabla cruzada del caso asignado.",
  "Repasar guías, talleres y retroalimentación; presentar dudas en monitoría.",
  "Leer guía 3.1 e identificar soporte, valores posibles y probabilidades.",
  "Calcular manualmente un valor esperado sencillo y explicar su significado.",
  "Revisar una tabla conjunta e identificar marginales y condicionales.",
  "Leer combinación lineal y ejecutar simulación introductoria.",
  "Reconocer las condiciones Bernoulli/binomial en tres escenarios.",
  "Revisar concepto de tasa y condiciones de Poisson.",
  "Leer diferencias entre variable discreta y continua.",
  "Explorar ejemplos de tiempos de espera y vida útil.",
  "Repasar z, simetría y regla empírica.",
  "Instalar/abrir el software y ejecutar el guion suministrado.",
  "Comparar fichas de modelos y justificar una elección preliminar.",
  "Resolver banco corto de problemas y registrar dudas.",
  "Preparar avance del proyecto: datos, pregunta, variables y análisis preliminar.",
  "Repasar el módulo 3 y asistir a monitoría con dudas priorizadas.",
  "Leer guía de muestreo y evaluar cómo se obtuvo una encuesta publicada.",
  "Revisar parámetro, estimador, error estándar y TLC.",
  "Calcular un intervalo preliminar con la base del proyecto.",
  "Leer un caso de contraste y formular H0 y H1.",
  "Resolver diagnóstico sobre pruebas de una y dos poblaciones.",
  "Revisar dispersión, correlación, recta y significado de pendiente.",
  "Preparar tablero/informe y ensayo de presentación del proyecto.",
  "Repasar módulos 4 y 5, proyecto y retroalimentación; preparar síntesis final."
)

durante <- c(
  "Presentación de la guía; diagnóstico; mapa de la metodología; equipos formulan una pregunta de administración, mercadeo o negocios.",
  "Dudas y preguntas; laboratorio de limpieza/codificación; ficha técnica de datos y discusión ética.",
  "Presentación guiada; construcción en software; galería crítica de visualizaciones y corrección de errores.",
  "Dudas; mini explicación; cálculo manual y en software; caso sobre ventas/salarios con decisión justificada.",
  "Taller por estaciones; comparación de grupos; retroalimentación entre pares; entrega de Actividad 1.",
  "Caso integrador; tablas cruzadas y gráfico de dispersión; interpretación oral breve; control de causalidad.",
  "Experimento/simulación; construcción de espacio muestral; formalización de axiomas y cierre con ticket.",
  "Dudas; resolución colaborativa con conteo y Venn; contraste entre estrategias.",
  "Árbol, tabla y Bayes aplicados a segmentación/calidad; explicación de decisiones en equipos.",
  "Prueba individual; preguntas de interpretación y aplicación; breve cierre metacognitivo.",
  "Presentación de guía; construir f(x) y F(x) desde un caso; verificar propiedades.",
  "Dudas; juego de decisión con pagos; cálculo de esperanza y riesgo; entrega de Actividad 2.",
  "Tablas conjuntas en equipos; marginales/condicionales; prueba de independencia contextual.",
  "Simulación computacional; comparación teoría-simulación; revisión del diseño del proyecto.",
  "Presentación de guía; reconocer supuestos; cálculo binomial manual/software; interpretación.",
  "Dudas; casos de llegadas/reclamos; estimación de tasa y validación; entrega de Actividad 3.",
  "Construcción conceptual de densidad/área; ejercicios con apoyo gráfico.",
  "Casos de inventarios y tiempos; selección de modelo; discusión de memoria y supuestos.",
  "Estandarización y percentiles; control de calidad/segmentación; interpretación no mecánica.",
  "Laboratorio reproducible; funciones de distribución, simulación y contraste de resultados; entrega de Actividad 4.",
  "Caso integrador con estaciones de decisión; cada equipo defiende modelo, supuestos y recomendación.",
  "Taller acumulativo tipo parcial; explicación entre pares; retroalimentación focalizada.",
  "Clínica de proyecto y laboratorio; revisión de evidencia, gráficos/cálculos y redacción de hallazgos.",
  "Prueba individual del módulo 3; selección de modelo, cálculo, supuestos e interpretación.",
  "Presentación de guía; diseño muestral para investigación de mercados; mapa de sesgos.",
  "Simulación de muestras; observar distribuciones de X̄ y p̂; conectar precisión con tamaño muestral.",
  "Construcción e interpretación de intervalos; escenarios de tamaño/confianza; entrega de Actividad 5.",
  "Presentación de guía; juicio simulado sobre H0; errores, alfa, valor p y decisión contextual.",
  "Dudas; pruebas con software; contraste significancia estadística/práctica; revisión de comunicación.",
  "Ajuste manual y en software; interpretación de pendiente/intercepto; predicción y límites causales.",
  "Diagnóstico de supuestos y prueba F; presentaciones del proyecto; preguntas de pares y mejora final.",
  "Prueba individual integradora; comunicación de una recomendación; cierre de objetivos y reflexión."
)

despues <- c(
  "Entregar definición del problema, población, muestra y diccionario inicial de variables.",
  "Entregar ficha técnica y base depurada; registrar decisión de tratamiento de faltantes.",
  "Corregir tabla/gráfico y redactar tres hallazgos con lenguaje estadístico.",
  "Completar laboratorio y añadir interpretación comparativa al portafolio.",
  "Entregar Actividad 1 (4%): informe descriptivo univariado reproducible.",
  "Entregar avance del proyecto: pregunta, datos y análisis descriptivo/bivariado.",
  "Completar ejercicios y registrar errores frecuentes en bitácora.",
  "Entregar solución argumentada de conteo y probabilidad.",
  "Entregar Actividad 2 (4%): caso de probabilidad condicionada/Bayes.",
  "Revisar retroalimentación y elaborar plan de mejora de módulos 1 y 2.",
  "Completar tabla de distribución y gráfico de F(x).",
  "Actualizar portafolio con comparación entre valor esperado y riesgo.",
  "Entregar interpretación de independencia y covarianza.",
  "Incorporar simulación y reflexión de convergencia al proyecto.",
  "Resolver práctica binomial y explicar dos resultados a un decisor.",
  "Entregar Actividad 3 (4%): caso binomial/Poisson con validación de supuestos.",
  "Completar problemas de densidad y acumulada.",
  "Entregar cuadro de selección uniforme/exponencial.",
  "Resolver práctica normal y verificarla con software.",
  "Entregar Actividad 4 (4%): laboratorio reproducible de modelos.",
  "Redactar recomendación ejecutiva de una página con limitaciones.",
  "Preparar formulario personal de conceptos y plan de repaso.",
  "Entregar avance del proyecto y atender observaciones antes del parcial.",
  "Corregir el parcial y documentar errores conceptuales/procedimentales.",
  "Entregar propuesta muestral y análisis de sesgos del proyecto.",
  "Completar simulación y explicar el TLC sin tecnicismo innecesario.",
  "Entregar Actividad 5 (4%): estimación e interpretación contextual.",
  "Formular pruebas pertinentes para el proyecto y justificar alfa.",
  "Entregar reporte corto con resultado, efecto, limitaciones y decisión.",
  "Completar estimación y diagnóstico inicial del modelo.",
  "Entregar/presentar trabajo aplicado (20%): informe, soporte reproducible y recomendación ejecutiva.",
  "Autoevaluación, corrección guiada y cierre del portafolio de aprendizaje."
)

evidencia <- c(
  "Mapa metodológico y ficha del problema","Ficha técnica y base depurada","Tabla, gráfico y hallazgos",
  "Laboratorio de indicadores","Actividad 1 (4%)","Avance 1 del proyecto","Ticket de salida",
  "Solución argumentada","Actividad 2 (4%)","Parcial 1 (20%)","Distribución f(x)/F(x)",
  "Bitácora de decisión","Tabla conjunta interpretada","Simulación comentada","Práctica binomial",
  "Actividad 3 (4%)","Ejercicios de densidad","Cuadro de selección","Práctica normal",
  "Actividad 4 (4%)","Recomendación ejecutiva","Taller acumulativo","Avance 2 del proyecto",
  "Parcial 2 (20%)","Diseño muestral","Simulación TLC","Actividad 5 (4%)","Formulación de hipótesis",
  "Reporte de contraste","Modelo inicial","Trabajo aplicado (20%)","Examen final (20%)"
)

monitoria <- as.Date(c(
  "2020-08-11","2020-08-18","2020-08-25","2020-09-01","2020-09-08",
  "2020-09-22","2020-09-29","2020-10-06","2020-10-13","2020-10-20",
  "2020-10-27","2020-11-03","2020-11-10","2020-11-17","2020-11-24"
))

programacion <- data.frame(
  Sesión=1:32,
  `Semana calendario`=semana_cal,
  `Semana de docencia`=semana_doc,
  Fecha=fechas,
  Día=rep(c("Miércoles","Viernes"),16),
  Módulo=modulo,
  `Tema central`=tema,
  `Objetivo de la sesión`=objetivo,
  `Antes de la sesión (trabajo independiente)`=antes,
  `Durante la sesión (120 min)`=durante,
  `Después de la sesión (trabajo independiente)`=despues,
  `Evidencia / evaluación`=evidencia,
  `Competencias priorizadas`=rep(c("C, R1, R2","C, R2, R3"),16),
  `Objetivos del syllabus`=c(rep("1, 3, 4",2),rep("1, 2, 3, 4",30)),
  check.names=FALSE
)

resumen <- data.frame(
  Módulo=c("1. Analiza tus datos","2. Mide la incertidumbre","3. Conoce los modelos estadísticos",
           "4. Generaliza resultados e hipótesis","5. Aplica lo aprendido"),
  Sesiones=c("1–6","7–9 (evaluación conjunta en 10)","11–23 (evaluación en 24)","25–30","31–32"),
  Propósito=c(
    "Resumir e interpretar información mediante tablas, indicadores y gráficos.",
    "Desarrollar pensamiento probabilístico para valorar incertidumbre y riesgo.",
    "Aplicar variables aleatorias y modelos discretos/continuos a situaciones de decisión.",
    "Generalizar resultados mediante muestreo, estimación y pruebas de hipótesis.",
    "Integrar regresión, software y comunicación en un trabajo aplicado."
  ),
  `Contenidos principales`=c(
    "Metodología; datos; univariado; bivariado; correlación.",
    "Eventos; axiomas; conteo; condicional; independencia; Bayes.",
    "f(x), F(x), esperanza, varianza, conjuntas, Bernoulli, binomial, Poisson, uniforme, exponencial y normal.",
    "Muestreo; TLC; distribuciones muestrales; intervalos; hipótesis; una y dos poblaciones.",
    "Regresión lineal simple; validación; prueba F; predicción; proyecto y comunicación."
  ),
  `Evaluación asociada`=c("Actividad 1; avance de proyecto","Actividad 2; Parcial 1",
                          "Actividades 3 y 4; Parcial 2","Actividad 5","Trabajo aplicado; Examen final"),
  check.names=FALSE
)

evaluacion <- data.frame(
  Componente=c("Parcial 1","Parcial 2","Examen final","Actividad 1","Actividad 2","Actividad 3",
               "Actividad 4","Actividad 5","Trabajo aplicado","TOTAL"),
  Peso=c(20,20,20,4,4,4,4,4,20,100),
  Fecha=c(as.Date("2020-09-04"),as.Date("2020-10-30"),as.Date("2020-11-27"),
          as.Date("2020-08-19"),as.Date("2020-09-02"),as.Date("2020-10-02"),
          as.Date("2020-10-16"),as.Date("2020-11-11"),as.Date("2020-11-25"),as.Date(NA)),
  Cobertura=c("Módulos 1 y 2","Módulo 3","Módulos 4 y 5","Módulo 1","Módulo 2",
              "Módulo 3","Módulo 3","Módulo 4","Integrador (módulos 1–5)",""),
  `Evidencia esperada`=c(
    "Comprensión, cálculo, interpretación y comunicación en contexto.",
    "Selección y aplicación de modelos con validación de supuestos.",
    "Inferencia, regresión, interpretación y decisión integradas.",
    "Informe descriptivo reproducible.","Caso de probabilidad condicionada/Bayes.",
    "Caso binomial/Poisson.","Laboratorio reproducible de modelos.",
    "Estimación e interpretación contextual.","Informe, soporte reproducible y presentación ejecutiva.",""
  ),
  check.names=FALSE
)

calendario <- data.frame(
  `Semana calendario`=1:17,
  Periodo=c("3–7 ago","10–14 ago","17–21 ago","24–28 ago","31 ago–4 sep","7–11 sep",
            "14–18 sep","21–25 sep","28 sep–2 oct","5–9 oct","12–16 oct","19–23 oct",
            "26–30 oct","2–6 nov","9–13 nov","16–20 nov","23–27 nov"),
  Estado=c(rep("Docencia",6),"Semana de reflexión",rep("Docencia",10)),
  `Sesiones / hito`=c("1–2","3–4","5–6","7–8","9–10; Parcial 1","11–12",
                      "Sin clase ni monitoría","13–14","15–16","17–18","19–20","21–22",
                      "23–24; Parcial 2","25–26","27–28","29–30","31–32; Examen final"),
  `Monitoría sugerida`=c(as.character(monitoria[1:5]),"2020-09-08","No programada",
                         as.character(monitoria[6:15])),
  check.names=FALSE
)

fuentes <- data.frame(
  Elemento=c("Syllabus","Calendario","Metodología","Criterio de módulos","Supuesto temporal",
             "Secuencia metodológica aplicada","Alineación evaluativa"),
  Descripción=c(
    "300MAE018 Estadística para la toma de decisiones: 64 horas, 32 sesiones de 2 horas; objetivos, competencias, contenidos, estrategias y pesos.",
    "img/calendario.png: clases miércoles y viernes; monitorías martes; semana de reflexión 14–18 de septiembre; parciales 4 de septiembre, 30 de octubre y 27 de noviembre.",
    "img/metodologia.png: ciclos de presentación/entrega de guía, dudas y preguntas, desarrollo y entrega de actividades.",
    "Se usan los cinco módulos nombrados en las imágenes del material. Los contenidos del syllabus se redistribuyen sin eliminar objetivos.",
    "Las fechas visibles corresponden al calendario agosto–noviembre de 2020. Se conserva ese año para que el archivo reproduzca fielmente la imagen.",
    "Cada fila explicita preparación previa, actividad de aula y consolidación posterior, combinando exposición breve, taller, caso, laboratorio, simulación, retroalimentación y proyecto.",
    "Parcial 1: módulos 1–2; parcial 2: módulo 3; examen final: módulos 4–5, según instrucción del solicitante."
  ),
  check.names=FALSE
)

write_xlsx(
  list(
    `Programación sesión a sesión`=programacion,
    `Resumen de módulos`=resumen,
    `Plan de evaluación`=evaluacion,
    `Calendario y monitorías`=calendario,
    `Fuentes y supuestos`=fuentes
  ),
  "Programacion_Estadistica_Toma_Decisiones.xlsx",
  format_headers=TRUE
)
