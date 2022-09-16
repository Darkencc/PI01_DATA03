from fastapi import APIRouter
from config.database import conne
from models.user import circuits
from models.user import races
from schemas.user import Circuit_BM
#from config.database import results

user = APIRouter()


@user.get("/")
def helloworld():
    return "hello world"

@user.get("/circuits")
def get_users():
    return conne.execute(circuits.select()).fetchall()

@user.get("/p1")
def pregunta_01(p1:int):
    return conne.execute(races.select().where(races.c.Year == p1)).fetchall()

@user.get("/p2")
def pregunta_01():
    return conne.execute(circuits.select()).fetchall()    
    
    
