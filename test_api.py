from flask import Flask
from flask_restful import Api, Resource , reqparse , abort

app = Flask(__name__)
api = Api(app)


film_put_args = reqparse.RequestParser()
film_put_args.add_argument("name" , type = str , help = "Name of film is required" , required = True)
film_put_args.add_argument("year" , type = int , help = "Year of film is required" , required = True)
film_put_args.add_argument("IMDB" , type = float , help = "IMDB of film is required" , required = True)





films = {"EN001" : {"name" : "A Quiet Place Part II" , "year" : 2020 , "IMDB" : 7.3},
        "EN002" : {"name" : "Tenet" , "year" :  2020 , "IMDB" : 7.4},
        }



def abort_if_film_id_doesnt_exist(film_id):
    if film_id not in films:
        abort(404 ,message =  "Film_id is not valid...")

def abort_if_video_exists(film_id):
    if film_id in films:
        abort(409, message = "Film already exists with that")



class Film(Resource):
    def get(self, film_id):
        abort_if_film_id_doesnt_exist(film_id)
        return films[film_id]
    
    def put(self , film_id):
        abort_if_video_exists(film_id)
        args = film_put_args.parse_args()
        films[film_id] = args
        return films[film_id]

    def delete(self, film_id):
        abort_if_film_id_doesnt_exist(film_id)
        del films[film_id]
        return "", 204


api.add_resource(Film , "/film/<string:film_id>")

if __name__ == "__main__":
    app.run(debug=True)