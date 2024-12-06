node('ubuntu-us-appserver-2140-60')
{

    def app
    stage('Cloning Git')
    {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('SAST') 
    {
        snykSecurity(

            snykInstallation: 'Snyk',

            snykTokenId: 'snyk-token',

            severity: 'critical'

         )
 
    }

    stage('Build-and-Tag')
    {
        /* This builds the actual image; 
             * This is synonymous to docker build on the command line */
        app = docker.build('emilykbrown/snake-test')
    }

    stage('Post-to-dockerhub')
    {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials')
        {
            app.push("latest")
        }
    
    }

    stage('Deploy')
    {
        sh "docker-compose down"
        sh "docker-compose up -d"
    }

}
