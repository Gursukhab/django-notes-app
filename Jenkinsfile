pipeline {
    agent { label "vinod" }

    stages {
        stage("Code") {
            steps {
                echo "Cloning the repository..."
                git url: "https://github.com/Gursukhab/django-notes-app.git", branch: "main"
            }
        }

        
        

        stage("Deploy") {
            steps {

                    echo "Running new container..."
                    sh "docker compose up "

                    echo "Waiting for container to be ready..."
                    sleep 5

                   
    }
}
    }
}
