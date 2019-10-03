# ML-Model-Deployment using Flask and Heroku

- The flask code for app deployment is from - https://github.com/pierpaolo28/Artificial-Intelligence-Projects/tree/master/ML-Deployement. Here is the [medium](https://towardsdatascience.com/flask-and-heroku-for-online-machine-learning-deployment-425beb54a274) article for elaborate code explanation. In summary:

- The ML model was created using python `pandas` and sklearn libraries and was then stored to be ready to make predictions using `pickle`.

- Using `Flask` has then been possible to create a web app which includes an HTML, CSS and Javascript interface to improve the design. It has then been possible to deploy this model online using Heroku.

This web app is also available in here - https://flask-ml-example.herokuapp.com/. 

## Model depolyment using Heroku

Here are the brief steps that are necessary for app deployment using Heroku:

- Create a Virtual environment
- Create a git repository in the directory where is our Flask App.
- Login into our Heroku account.
- Create a Heroku project.
- Create a `requirements.txt`, `runtime.txt` and `Procfile`.
- Add all the files in the directory to the repository.
- Push the app to the web!

The first four steps can be implemented by running sequentially the following commands in the command prompt.

```
$ virtualenv ml
$ source ml/bin/activate

$ git init

$ heroku login

$ heroku create flask-ml-example
Creating ⬢ flask-ml-example... done
https://flask-ml-example.herokuapp.com/ | https://git.heroku.com/flask-ml-example.git
```

Creating a `requirements.txt` file it is necessary to inform Heroku of what libraries are needed in order to run our Flask App. Therefore in the requirements.txt file, we write one for each line just the names of all the library used. 

For this application, the `Procfile` instead just need to contain one line of text (as shown below). The Procfile is needed to let Heroku know what type of application we desire to execute.

```
web: gunicorn app:app
```

Steps six and seven can then be executed by running sequentially the following commands in the command line.

```
git add .
git commit -m "Committing all the directory files to Heroku"
git push heroku master
heroku open
```

Using the heroku open command should open the webpage where our Flask App has been deployed. Alternatively, it is possible to find out the link where our model is deployed by logging in online on our Heroku account. Visiting the Heroku website can be particularly useful especially in the case any problem has been registered during the lunch of our Flask App.

Optionally you can create a new repo in your github repo and then push the current files into that repository







