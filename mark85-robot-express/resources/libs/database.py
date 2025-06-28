from robot.api.deco import keyword
from pymongo import MongoClient
from dotenv import load_dotenv
import os

# Carrega variáveis do .env
load_dotenv()

# Lê a URI do Mongo a partir da variável de ambiente
mongo_uri = os.getenv("MONGO_URI")

Client = MongoClient(mongo_uri)
db = Client["markdb"]

@keyword("Remover usuário do banco de dados")
def remove_user(email):
    users = db['users']
    users.delete_many({"email": email})
    print(f"Usuários com o email {email} removidos com sucesso.")

@keyword("Inserir usuário no banco de dados")
def insert_user(usuario):
    users = db['users']
    users.insert_one(usuario)
    print(usuario)
