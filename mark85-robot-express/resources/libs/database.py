from robot.api.deco import keyword

from pymongo import MongoClient

Client = MongoClient("mongodb+srv://gama:gama87@cluster0.xmw1vbs.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")

db = Client["markdb"]

@keyword("Remover usuário do banco de dados")
def remove_user(email):
    users = db['users']
    users.delete_many({"email": email})
    print(f"Usuários com o email {email} removidos com sucesso.")