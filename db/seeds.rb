# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# ###########################################
#Agregamos Ciudades
City.create(name:"Bogotá", type:"")
City.create(name:"Medellín", type:"")
City.create(name:"Cali", type:"")
City.create(name:"Barranquilla", type:"")
City.create(name:"Soledad", type:"")
City.create(name:"Cúcuta", type:"")
City.create(name:"Soacha", type:"")
City.create(name:"Ibagué", type:"")
City.create(name:"Bucaramanga", type:"")
City.create(name:"Cartagena", type:"")
City.create(name:"Jamundí", type:"")
City.create(name:"Santa Marta", type:"")
City.create(name:"Pereira", type:"")
City.create(name:"Manizales", type:"")
City.create(name:"Girón", type:"")
City.create(name:"La estrella", type:"")
City.create(name:"Sabaneta", type:"")
City.create(name:"Popayán", type:"")
City.create(name:"Pasto", type:"")
City.create(name:"Tumaco", type:"")

#Agregamos Measure o medida
Measure.create(name:"PERCENT")
Measure.create(name:"NUMBER")

# Creamos el Goal o el ODS
Goal.create(number:"01", name:"PONER FIN A LA POBREZA EN TODAS SUS FORMAS EN TODO EL MUNDO.", description:"Este objetivo consiste en aumentar los ingresos de las personas más
pobres y en garantizar un acceso a los servicios básicos y proteger a todo
el mundo de los desastres naturales y de los desastres de origen humano")

#los target del Goal 1
Target.create(number:"1.1", name:"Para 2030, ERRADICAR LA
POBREZA EXTREMA para
todas las personas en el mundo.
Actualmente, se considera que
viven en la pobreza extrema a las
personas que subsisten con menos
de 1,25 $ al día", available:1, goal_id:1)

##save indicator
Indicator.create(number:"1.1.1", name:"Incidencia de pobreza monetaria extrema", available:1, data_type:"",
                 national_base_line:"7.9",national_goal:"4.8",reference_value_low:"<4",reference_value_mid:"4-8",
                 reference_value_high:">8", target_id:1,institutional_inf:"", comment:"Propuesta RCCV",
                 methodological_proposal:"Proy. datos historicos")
###end indicator###

Target.create(number:"1.2", name:"Para 2030 reducir al menos
a la mitad la proporción
de hombres, mujeres y niños
de todas las edades que viven
en la POBREZA EN TODAS SUS
DIMENSIONES con arreglo a las
definiciones nacionales", available:1, goal_id:1)

#save indicator
Indicator.create(number:"1.2.1", name:"Incidencia de la Pobreza Monetaria", available:1, data_type:"FLOAT",
                 national_base_line:"27.8",national_goal:"18.7",reference_value_low:"<12",reference_value_mid:"12-25",
                 reference_value_high:">25", target_id:2,institutional_inf:"", comment:"BID",
                 methodological_proposal:"Proy. datos historicos")

Indicator.create(number:"1.2.2", name:"Incidencia de pobreza monetaria extrema", available:1, data_type:"FLOAT",
                 national_base_line:"7.9",national_goal:"4.8",reference_value_low:"<4",reference_value_mid:"4-8",
                 reference_value_high:">8", target_id:2,institutional_inf:"", comment:"BID",
                 methodological_proposal:"Proy. datos historicos")
###end indicator###

Target.create(number:"1.3", name:"Para 2030, garantizar
que todos los hombres
y mujeres, en particularlos
pobres y los vulnerables, tengan
los mismos derechos sobre los
recursos económicos, así como
ACCESSO A LOS SERVICIOS
BÁSICOS, la propiedad y el control
de las tierraS(y otros bienes, la
herencia, los recursos naturales,
las nuevas tecnologías apropiadas
y servicios financieros, incluida las
microfinanciación", available:1, goal_id:1)

Target.create(number:"1.5", name:"Para 2030, FOMENTAR
LA RESILIENCIA DE LOS
POBRES y las personas que
se encuentran en situaciones
vulnerables y reducir su
exposición y vulnerabilidad a los
fenómenos extremos relacionados
con el clima y otras crisis y
desastres económicos, sociales y
ambientales", available:1, goal_id:1)

########end target 1########


Goal.create(number:"02", name:"PONER FIN
AL HAMBRE ,
LOGRAR LA SEGURIDAD
ALIMENTARIA Y LA MEJORA DE
LA NUTRICIÓNY PROMOVER LA
AGRICULTURA SOSTENIBLE.", description:"Este objetivo consiste en garantizar que todo el mundo pueda
beneficiarse de una dieta saludable y nutritiva durante todo el año")

########start target 2.1########
Target.create(number:"2.1", name:"Para 2030, PONER FIN AL
HAMBRE y asegurar el
acceso de todas las personas, en
particular los pobres y las personas en
situaciones vulnerables, incluidos los
lactantes, a una alimentación sana,
nutritiva y suficiente durante
todo el año", available:1, goal_id:2)
########end target 2.1########

#save indicator
Indicator.create(number:"2.1.1", name:"Prevalencia de inseguridad alimentaria en el hogar (moderada o severa)",
                 available:1, data_type:"",
                 national_base_line:"",national_goal:"",reference_value_low:"",reference_value_mid:"",
                 reference_value_high:"", target_id:5,institutional_inf:"", comment:"",
                 methodological_proposal:"Referente internacional")
###end indicator###

########start target 2.2########
Target.create(number:"2.2", name:"Para 2030, PONER FIN AL
HAMBRE y asegurar el
acceso de todas las personas, en
particular los pobres y las personas en
situaciones vulnerables, incluidos los
lactantes, a una alimentación sana,
nutritiva y suficiente durante
todo el año", available:1, goal_id:2)
########end target 2.2########

#save indicator
#
#

Indicator.create(number:"2.2.1", name:"Prevalencia de inseguridad alimentaria en el hogar (moderada o severa)",
                 available:1, data_type:"FLOAT",
                 national_base_line:"6.8",national_goal:"5.0",reference_value_low:"<4",reference_value_mid:"4-7",
                  reference_value_high:">7", target_id:6,institutional_inf:"", comment:"Propuesta RCCV",
                 methodological_proposal:"Proy. datos historicos")

Indicator.create(number:"2.2.2", name:"Tasa de mortalidad por desnutrición en menores de 5 años (por cada 100.000 menores)",
                 available:1, data_type:"FLOAT",
                 national_base_line:"6.8",national_goal:"5.0",reference_value_low:"<4",reference_value_mid:"4-7",
                 reference_value_high:">7", target_id:6,institutional_inf:"", comment:"Propuesta RCCV",
                 methodological_proposal:"Proy. datos historicos")

###end indicator###

###end goal 2 ###

Goal.create(number:"03", name:"GARANTIZAR
UNA VIDA SANA
Y PROMOIVER EL BIENESTAR PARA
TODOS EN TODAS LAS EDADES.", description:"Este objetivo consiste en ayudar a las personas
a vivir más tiempo y en mejores condiciones")

########start target 3.1########
Target.create(number:"3.1", name:"Para 2030, reducir la tasa
mundial de MORTALIDAD
MATERNA a menos de 70 por cada
100.000 nacidos vivos", available:1, goal_id:3)
########end target 3.1#######

#save indicator
Indicator.create(number:"3.1.1", name:"Razón de mortalidad materna a 42 días (Tasa por cada 100K niños nacidos vivos)",
                 available:1, data_type:"NUMERO",
                 national_base_line:"53.7",national_goal:"32.0",reference_value_low:"<30",reference_value_mid:"30-55",
                 reference_value_high:">55", target_id:7,institutional_inf:"", comment:"Propuesta RCCV",
                 methodological_proposal:"Referente internacional")

###end indicator###
#
########start target 3.2########
Target.create(number:"3.2", name:"Para 2030, poner fin a las
muertes evitables de recién
nacidos y de niños menores
de 5 años", available:1, goal_id:3)
########end target 3.2########

#save indicator
Indicator.create(number:"3.2.1", name:"Tasa de mortalidad infantil en menores de 1 año (ajustada)",
                 available:1, data_type:"NUMERO",
                 national_base_line:"17.1",national_goal:"14.0",reference_value_low:"<14",reference_value_mid:"14-17",
                 reference_value_high:">17", target_id:8,instiutional_inf:"", comment:"Propuesta RCCV",
                 methodological_proposal:"Referente internacional")
Indicator.create(number:"3.2.2", name:"Tasa de mortalidad en menores de 5 años (ajustada)",
                 available:1, data_type:"NUMERO",
                 national_base_line:"53.7",national_goal:"32.0",reference_value_low:"<30",reference_value_mid:"30-55",
                 reference_value_high:">55", target_id:7,institutional_inf:"", comment:"Propuesta RCCV",
                 methodological_proposal:"Referente internacional")
###end indicator###

###end goal 3 ###

Goal.create(number:"04", name:"GARANTIZAR UNA
EDUCACIÓN INCLUSIVA, EQUITATIVA
Y DE CALIDAD Y PROMOVER
OPORTUNIDADES DE APRENDIZAJE
DURANTE TODA LA VIDA PARA TODOS.", description:"Este objetivo consiste en proporcionar a todas las personas el acceso
ala educación, a la formación y al pleno desarrollo de su potencial")

########start target 4.1########
Target.create(number:"4.1", name:"Para 2030, velar por que todas las niñas
y todos los niños terminen los ciclos
de la ENSEÑANZA PRIMARIA Y SECUNDARIA,
que ha de ser gratuita, equitativa y de calidad
y producir resultados escolares pertinentes y
eficaces", available:1, goal_id:4)
########end target 4.1#######

#save indicator
Indicator.create(number:"4.1.1", name:"Tasa de cobertura bruta en educación media",
                 available:1, data_type:"",
                 national_base_line:"77.8",national_goal:"",reference_value_low:">70",reference_value_mid:"51-70",
                 reference_value_high:"<51", target_id:9,institutional_inf:"", comment:"BID (Ojo, meta cobertura neta)",
                 methodological_proposal:"Pendiente")
###end indicator###

#save indicator
Indicator.create(number:"4.1.2", name:"Índice sintético de calidad en media",
                 available:1, data_type:"",
                 national_base_line:"",national_goal:"",reference_value_low:"",reference_value_mid:"",
                 reference_value_high:"", target_id:9,institutional_inf:"", comment:"",
                 methodological_proposal:"Pendiente")

Indicator.create(number:"4.1.2", name:"Índice sintético de calidad en media",
                 available:1, data_type:"",
                 national_base_line:"",national_goal:"",reference_value_low:"",reference_value_mid:"",
                 reference_value_high:"", target_id:9,institutional_inf:"", comment:"",
                 methodological_proposal:"Pendiente")
###end indicator###

###end goal 4 ###


Goal.create(number:"05", name:"LOGRAR LA IGUALDAD
ENTRE LOS GÉNEROS
Y EMPODERAR A TODAS
LAS MUJERES Y NIÑAS.", description:"Este objetivo consiste en acabar con la violencia y la discriminación
contra las mujeres y las chicas y asegurar que tengan las mismas
oportunidades en todos los ámbitos de la vida")

########start target 5.1########
Target.create(number:"5.1", name:"Poner fin a TODAS LAS FORMAS
DE DISCRIMINACIÓN contra
todas las mujeres y niñas en todo el
mundo", available:1, goal_id:5)
########end target 5.1#######

########start target 5.2########
Target.create(number:"5.2", name:"Eliminar todas las formas de
VIOLENCIA CONTRA TODAS
LAS MUJERES y niñas en los ámbitos
público y privado, incluidas la trata y
la explotación sexual y otros tipos de
explotación", available:1, goal_id:5)
########end target 5.2#######

#save indicator
Indicator.create(number:"5.2.1", name:"Mujeres afectadas por violencia de parejas",
                 available:1, data_type:"",
                 national_base_line:"",national_goal:"",reference_value_low:"<14",reference_value_mid:"14-25",
                 reference_value_high:">25", target_id:11,institutional_inf:"",
                 comment:"BID (Porcentaje de mujeres que han sufrido violencia física de parte de una pareja o ex pareja alguna
vez en la vida)", methodological_proposal:"Proy. datos historicos")
###end indicator###

###end goal 5 ###


Goal.create(number:"06", name:"GARANTIZAR LA DISPONIBILIDAD
Y LA GESTIÓN SOSTENIBLE
DE AGUA Y SANEAMIENTO
PARA TODOS.", description:"Este objetivo consiste en garantizar que todo el mundo tenga
acceso a agua potable limpia y a instalaciones sanitarias")

Goal.create(number:"07", name:"GARANTIZAR EL ACCESO A UNA
ENERGÍA ASEQUIBLE, SEGURA,
SOSTENIBLE Y MODERNA PARA TODOS.", description:"Este objetivo consiste en garantizar que todo el mundo tenga
acceso a energía verde")

Goal.create(number:"08", name:"PROMOVER UN
CRECIMIENTO
ECONÓMICO SOSTENIDO INCLUSIVO
Y SOSTENIBLE EL EMPLEO PLENO
Y PRODUCTIVO Y EL
TRABAJO DECENTE PARA TODOS.", description:"Este objetivo consiste en crear puestos de trabajo dignos
yoportunidades económicas para todos")

Goal.create(number:"09", name:"CONSTRUIR
INFRAESTRUCTURAS
RESILIENTES, PROMOVER UNA
INDUSTRIALIZACIÓN INCLUSIVA Y
SOSTENIBLE Y FOMENTAR
LA INNOVACIÓN.", description:"Este objetivo consiste en garantizar que todo el mundo
disponga de las infraestructuras necesarias para conectarse
con el resto del mundo")

Goal.create(number:"10", name:"REDUCIR LA
DESIGUALDAD
EN Y ENTRE TODOS LOS PAÍSES.", description:"Este objetivo consiste en reducir la distancia entre
los más ricos y los más pobres")

Goal.create(number:"11", name:"LOGRAR QUE
LAS CIUDADES
Y LOS ASENTAMIENTOS
HUMANOS SEAN INCLUSIVOS,
SEGUROS,
RESILIENTES Y SOSTENIBLES.", description:"Este objetivo consiste en situar a las ciudades en el centro
deldesarrollo sostenible en un mundo cada vez más urbanizado")

Goal.create(number:"12", name:"GARANTIZAR MODALIDADES DE
CONSUMO Y PRODUCCIÓN
SOSTENIBLES.", description:"Este objetivo consiste en reducir nuestro impacto en el planeta
produciendo y consumiendo solamente lo que necesitamos")

Goal.create(number:"13", name:"ADOPTAR MEDIDAS URGENTES
PARA COMBATIR EL
CAMBIO CLIMÁTICO
Y SUS EFECTOS.", description:"Este objetivo consiste en gestionar los efectos del
calentamiento global")

Goal.create(number:"14", name:"CONSERVAR Y UTILIZAR DE FORMA
SOSTENIBLE LOS OCÉANOS ,
LOS MARES Y LOS RECURSOS MARINOS
PARA EL DESARROLLO SOSTENIBLE.", description:"Este objetivo consiste en proteger las costas y los océanos")

Goal.create(number:"15", name:"PROMOVER EL USO
SOSTENIBLE DE
LOS ECOSISTEMAS
TERRESTRES, LUCHAR CONTRA
LA DESERTIFICACIÓN, DETENER E
INVERTIR LA DEGRADACIÓN DE
LAS TIERRAS Y FRENAR LA PÉRDIDA
DE LA DIVERSIDAD BIOLÓGICA.", description:"Este objetivo consiste en proteger la fauna
y los recursos naturales")

Goal.create(number:"16", name:"LOGRAR LA IGUALDAD
ENTRE LOS GÉNEROS
Y EMPODERAR A TODAS
LAS MUJERES Y NIÑAS.", description:"Este objetivo consiste en acabar con la violencia y la discriminación
contra las mujeres y las chicas y asegurar que tengan las mismas
oportunidades en todos los ámbitos de la vida")

Goal.create(number:"05", name:"PROMOVER SOCIEDADES
PACÍFICAS E INCLUSIVAS
PARA EL DESARROLLO SOSTENIBLE,
FACILITAR EL ACCESO A LA JUSTICIA
PARA TODOS Y CREAR INSTITUCIONES
INSTITUCIONESEFICACES, RESPONSAB", description:"Este objetivo consiste en mantener la seguridad de las personas
y garantizar que el gobierno trabaja de forma efectiva y justa")

Goal.create(number:"17", name:"FORTALECER LOS MEDIOS DE
EJECUCIÓN Y REVITALIZAR LA
ALIANZA MUNDIAL GLOBAL
PARA EL DESARROLLO SOSTENIBLE.", description:"Este objetivo consiste en colaborar a nivel global para alcanzar los
Objetivos de Desarrollo Sostenible y hacer realidad la Agenda Post-2015")

####START WITH INDICATOR_VALUE ########
IndicatorValue.create(indicator_id:1, city_id:1, value:"5.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:1, city_id:2, value:"50.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:1, city_id:3, value:"25", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:1, city_id:4, value:"60", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:2, city_id:1, value:"10", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:2, city_id:2, value:"30", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:2, city_id:3, value:"1", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:2, city_id:4, value:"15", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:2, city_id:1, value:"10", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:2, city_id:2, value:"30", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:2, city_id:3, value:"1", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:2, city_id:4, value:"15", from:"2017-01-01", to:"2017-12-31")

IndicatorValue.create(indicator_id:3, city_id:1, value:"5.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:3, city_id:2, value:"50.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:3, city_id:3, value:"25", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:3, city_id:4, value:"60", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:3, city_id:1, value:"10", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:3, city_id:2, value:"30", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:4, city_id:3, value:"1", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:4, city_id:4, value:"15", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:4, city_id:1, value:"10", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:4, city_id:2, value:"30", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:4, city_id:3, value:"1", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:4, city_id:4, value:"15", from:"2017-01-01", to:"2017-12-31")


IndicatorValue.create(indicator_id:5, city_id:1, value:"5.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:5, city_id:2, value:"50.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:5, city_id:3, value:"25", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:5, city_id:4, value:"60", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:5, city_id:1, value:"10", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:6, city_id:2, value:"30", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:6, city_id:3, value:"1", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:6, city_id:4, value:"15", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:6, city_id:1, value:"10", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:6, city_id:2, value:"30", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:6, city_id:3, value:"1", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:6, city_id:4, value:"15", from:"2017-01-01", to:"2017-12-31")

IndicatorValue.create(indicator_id:7, city_id:1, value:"5.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:7, city_id:2, value:"50.2", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:7, city_id:3, value:"25", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:7, city_id:4, value:"60", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:7, city_id:1, value:"10", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:7, city_id:2, value:"30", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:8, city_id:3, value:"1", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:8, city_id:4, value:"15", from:"2018-01-01", to:"2018-12-31")
IndicatorValue.create(indicator_id:8, city_id:1, value:"10", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:9, city_id:2, value:"30", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:9, city_id:3, value:"1", from:"2017-01-01", to:"2017-12-31")
IndicatorValue.create(indicator_id:9, city_id:4, value:"15", from:"2017-01-01", to:"2017-12-31")
