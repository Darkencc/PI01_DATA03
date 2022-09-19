from copyreg import constructor
from unittest import result
from fastapi import FastAPI
import pandas as pd
import numpy as np
import json


app = FastAPI()

@app.get("/")
async def Welcome():
    return "Bienvenido a mi Appi.2.0, ya que la primera vez falle :v"


#ITEM 1: Hallar el Año con más carreras

@app.get("/año_con_mas_carreras")
async def año_mas_carreras():
    races = pd.read_csv(r'.\Datasets\races.csv')
    df_races = pd.DataFrame(races['year'].value_counts())
    df_races.reset_index(inplace=True)

    a = df_races['index'][0]
    b = df_races['year'][0]

    return f"El año con más carreras fue {a} con {b}"

#ITEM 2: Piloto con mayor cantidad de primeros puestos

@app.get("/piloto_con_mas_puestos")
async def piloto_mas_puestos():
    results = pd.read_json(r'.\Datasets\results.json', lines=True)

    #Filtrando con una máscara los primeros puestos
    position_one = results['position'] == 1
    #Aplicado la mascara al df
    primeros_puestos = results[position_one]['driverId'].value_counts()

    #Cargando el otro archivo json necesario
    drivers = pd.read_json(r'.\Datasets\drivers.json', lines=True)
    name = drivers['name'].apply(pd.Series)
    fn = name['forename'][0]
    sn = name['surname'][0]

    return f"El piloto con más primeros puestos fue: {fn} {sn}"

# ITEM 3: El nombre del circuito más corrido

@app.get("/Circuito_mas_corrido")
async def circuito_mas_corrido():
    circuits = pd.read_csv(r".\Datasets\circuits.csv")
    races = pd.read_csv(r".\Datasets\races.csv")
    races['circuitId'].value_counts()
    i_3 = circuits['name'][13]

    return f"El circuito más corrido fue {i_3}"

# ITEM 4: Piloto con mayor cantidad de puntos en total, cuyo constructor sea de nacionalidad American o British

@app.get("/Piloto_con_mas_puntos_por_constructor")
async def piloto_con_mas_puntos_segun_comstructor():
    constructors = pd.read_json(r".\Datasets\constructors.json", lines=True)
    results = pd.read_json(r".\Datasets\results.json", lines=True)

    #Uniendo los df:
    results_and_constructors = pd.merge(results, constructors, on = 'constructorId')
    #Filtrando en una mascara si es british o american
    british_or_american = results_and_constructors['nationality'].isin(['British', 'American'])
    results_and_constructors[british_or_american].groupby('driverId')['points'].sum().sort_values(ascending= False)
    
    #Cargando el otro archivo json necesario
    drivers = pd.read_json(r'.\Datasets\drivers.json', lines=True)
    name = drivers['name'].apply(pd.Series)
    i4 = name['forename'][17]
    i5 = name['surname'][17]
    

    return f'El piloto con mayor puntos, cuyo constructor sea american o british es: {i4} {i5}'

