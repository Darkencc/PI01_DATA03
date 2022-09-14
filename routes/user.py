from fastapi import APIRouter
from config.database import conne
from models.user import users

user = APIRouter()

@user.get("/users")
def get_users():
    return conne.execute(users.select()).fetch_all()

@user.get("/users")
def helloworld():
    return "hello world"
