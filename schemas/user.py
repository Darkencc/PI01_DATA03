from ast import Str
from re import S
from typing import Optional
from pydantic import BaseModel

class Circuit_BM(BaseModel):
    Idcircuit: int
    Refcircuit: str
    Name: str
    Location: str
    Country: str 
    Latitud: str
    Longitud: str
    Altitud: str
    URL: str